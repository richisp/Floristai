class OrdersController < ApplicationController
  before_action :require_user_logged_in!
  before_action :restricted_admin_access!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
