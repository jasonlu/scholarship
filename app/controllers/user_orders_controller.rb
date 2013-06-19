class UserOrdersController < ApplicationController

  #before_filter :authenticate_user!


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

  # POST /user_orders/new
  # POST /user_orders/new.json
  def new

    session_id = cookies[:cart_id]
    #order_number = current_user.id.to_s + Time.now.to_i.to_s
    order_number = session_id.to_i(16).to_s
    carts = Cart.where("session_id = ?", session_id)

    if carts.length == 0

      @courses = Array.new(Course.new)

    else

      courses_array = Array.new
      price = 0
      carts.each do |cart|
        price = price + cart.course.price
        courses_array.push(cart.course_id)
      end
      courses = courses_array.join(",")

      @user_order = UserOrder.find_by_order_number(order_number)

      if @user_order.blank?
        @user_order = UserOrder.new
        @user_order.user_id = current_user.id
        @user_order.payment_status = 0
        @user_order.payment_method = 0
        @user_order.payment_price = price
        @user_order.courses = courses
        @user_order.order_number = order_number
        @user_order.save!
      else

        @courses = Course.find(@user_order.courses.split(','))

      end

      
    end

    respond_to do |format|
      format.html { render 'show' }
      format.json { render json: @user_order }
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
