class OrdersController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
