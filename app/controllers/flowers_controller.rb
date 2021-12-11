class FlowersController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_flower, only: %i[show edit update destroy]
  before_action :restricted_admin_access!, except: %i[index]

  # GET /flowers or /flowers.json
  def index
    @flowers = Flower.search(params[:query])
  end

  # GET /flowers/1 or /flowers/1.json
  def show; end

  # GET /flowers/new
  def new
    @flower = Flower.new
  end

  # GET /flowers/1/edit
  def edit; end

  # POST /flowers or /flowers.json
  def create
    @flower = Flower.new(flower_params.merge({ user_id: Current.user.id }))

    respond_to do |format|
      if @flower.save
        @flower.images.attach(params[:flower][:images])
        format.html { redirect_to @flower, notice: "Flower was successfully created." }
        format.json { render :show, status: :created, location: @flower }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flowers/1 or /flowers/1.json
  def update
    respond_to do |format|
      if @flower.update(flower_params)
        @flower.images.destroy_all
        @flower.images.attach(params[:flower][:images])
        format.html { redirect_to @flower, notice: "Flower was successfully updated." }
        format.json { render :show, status: :ok, location: @flower }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flowers/1 or /flowers/1.json
  def destroy
    @flower.destroy
    respond_to do |format|
      format.html { redirect_to flowers_url, notice: "Flower was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_order
    order = Order.new(
      user_id: Current.user.id,
      flower_id: params[:id],
      quantity: params[:quantity],
      status: 'pending'
    )

    respond_to do |format|
      if order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_flower
    @flower = Flower.find(params[:id])
  end

  def flower_params
    params.require(:flower).permit(:title, :description, :flowering_time, :user_id, :query)
  end
end
