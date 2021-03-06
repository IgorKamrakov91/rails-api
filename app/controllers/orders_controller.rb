class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
    render json: @orders
  end

  # POST /orders
  def create
    @table = Table.find(params[:table_id])
    @order = @table.orders.build(order_params)

    if @order.save
      render json: @order, status: :created#, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def add
    @order = Order.find params[:id]
    order_item = OrderItem.where(order_id: @order.id, item_id: params[:item_id]).first.increment(:quantity) rescue @order.order_items.build(item_id: params[:item_id])


    if order_item.save
      render json: order_item, status: 201
    else
      render json: order_item.errors, status: :unprocessable_entity
    end
  end

  def pay
    @order = Order.find(params[:id])
    service = OrderPayer.new(@order)
    service.pay(params[:amount].to_i, params[:payment_method])

    if service.ok?
      render json: service.receipt, root: true, status: 201
    else
      render json: service.message, status: 422
    end
  end

  private
    def order_params
      params.require(:order).permit(:name, :email, :table_id)
    end
end
