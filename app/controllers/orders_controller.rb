require 'csv'

class OrdersController < ApplicationController
  before_action :require_user_logged_in!
  before_action :restricted_admin_access!

  def index
    @orders = Order.all
  end

  def finish
    Order.find(params[:id]).finished!
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully finished.' }
    end
  end

  def cancel
    Order.find(params[:id]).canceled!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully canceled.' }
    end
  end

  def generate_report
    year, month = params[:month].split('-')

    @orders = Order.where("cast(strftime('%Y', created_at) as int) = ?", year)
                   .where("cast(strftime('%m', created_at) as int) = ?", month)

    respond_to do |format|
      format.csv do
        headers['Content-Disposition'] = 'attachment; filename=orders_report.csv'
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end
end
