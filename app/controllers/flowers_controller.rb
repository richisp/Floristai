class FlowersController < ApplicationController
  before_action :set_flower, only: %i[ show edit update destroy ]

  # GET /flowers or /flowers.json
  def index
    @flowers = Flower.search(params[:query])
  end

  # GET /flowers/1 or /flowers/1.json
  def show
  end

  # GET /flowers/new
  def new
    @flower = Flower.new
  end

  # GET /flowers/1/edit
  def edit
  end

  # POST /flowers or /flowers.json
  def create
    @flower = Flower.new(flower_params.merge({ user_id: User.first.id }))

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
    order = Order.create!(user: User.first)

    order.order_flowers.create(flower_id: params[:id], quantity: params[:quantity])

    redirect_to flowers_path
  end

  private

  def set_flower
    @flower = Flower.find(params[:id])
  end

  def flower_params
    params.require(:flower).permit(:title, :description, :flowering_time, :user_id, :query)
  end
end
