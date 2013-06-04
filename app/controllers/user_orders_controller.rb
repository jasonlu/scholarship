class UserOrdersController < ApplicationController
  # GET /user_orders
  # GET /user_orders.json
  def index
    @user_orders = UserOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_orders }
    end
  end

  # GET /user_orders/1
  # GET /user_orders/1.json
  def show
    @user_order = UserOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_order }
    end
  end

  # GET /user_orders/new
  # GET /user_orders/new.json
  def new
    @user_order = UserOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_order }
    end
  end

  # GET /user_orders/1/edit
  def edit
    @user_order = UserOrder.find(params[:id])
  end

  # POST /user_orders
  # POST /user_orders.json
  def create
    @user_order = UserOrder.new(params[:user_order])

    respond_to do |format|
      if @user_order.save
        format.html { redirect_to @user_order, notice: 'User order was successfully created.' }
        format.json { render json: @user_order, status: :created, location: @user_order }
      else
        format.html { render action: "new" }
        format.json { render json: @user_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_orders/1
  # PUT /user_orders/1.json
  def update
    @user_order = UserOrder.find(params[:id])

    respond_to do |format|
      if @user_order.update_attributes(params[:user_order])
        format.html { redirect_to @user_order, notice: 'User order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_orders/1
  # DELETE /user_orders/1.json
  def destroy
    @user_order = UserOrder.find(params[:id])
    @user_order.destroy

    respond_to do |format|
      format.html { redirect_to user_orders_url }
      format.json { head :no_content }
    end
  end
end
