module Api

  class OrdersController < ActionController::Base
    before_action :set_order, only: %i[ show edit update destroy ]

    # GET /orders or /orders.json

    def index
      user_type = params[:type]
      user_id = params[:id]
    
      case user_type
      when 'customer'
        orders = Order.where(customer_id: user_id)

        customer = Customer.where(id: user_id).first
        customer_name = customer.user.name
        customer_address = customer.address.street_address

        # order = Order.find(<order_id>)
        # product_orders = order.product_orders # lista de associações ProductOrder
        # @order = Order.includes(product_orders: :product).find(@order.id)
        # products = Product.includes(product_orders: :product)


        # products_from_orders = orders.includes(product_order: :product).map do |order|
        #   {
        #     id: order.id,
        #     product_name: order.product_order.product.name
        #   }
        # end

        # products_from_orders = orders.includes(product_order: :product).map do |order|
        #   {
        #     id: order.id,
        #     products: order.product_order.map do |product_order|
        #       {
        #         name: product_order.product.name,
        #         quantity: product_order.quantity,
        #         price: product_order.product.price
        #       }
        #     end
        #   }
        # end
        


        # orders_with_status = orders.includes(:order_status).map do |order|
        #   {
        #     id: order.id,
        #     status_name: order.order_status.name
        #   }
        # end
        orders_with_courier_user = orders.includes(courier: :user).map do |order|
          {
            id: order.id,
            courier_name: order.courier.user.name
          }
        end
        orders_with_restaurant_address = orders.includes(restaurant: :address).map do |order|
          {
            id: order.id,
            restaurant_address: order.restaurant.address.street_address,
            restaurant_name: order.restaurant.name
          }
        end
        customer_info = orders.map do |order|
          order.attributes.merge(
            customer_name: customer_name,
            customer_address: customer_address,
            restaurant_address: order.restaurant.address.street_address,
            restaurant_name: order.restaurant.name,
            courier_name: order.courier.user.name,
            status: order.order_status.name
            # product_name: order.product_order.product.name

          )
        end
    
      when 'restaurant'
        orders = Order.where(restaurant_id: user_id)
      when 'courier'
        orders = Order.where(courier_id: user_id)
      else
        render json: { error: 'Invalid user type' }, status: :bad_request
        return
      end
    
      render json: { orders: customer_info }, status: :ok
    end
    

    # def index
    #   user_type = params[:type]
    #   user_id = params[:id]
    
    #   case user_type
    #   when 'customer'
    #     orders = Order.where(customer_id: user_id).includes(restaurant: :address)
    #     customer = Customer.where(id: user_id).first
    #     customer_name = customer.user.name
    #     customer_address = customer.address.street_address
    #     orders_with_restaurant_address = orders.map do |order|
    #       {
    #         id: order.id,
    #         restaurant_address: order.restaurant.address.street_address,
    #         # outras informações relevantes do pedido
    #       }
    #     end
    #     customer_info = orders.map do |order|
    #       order.attributes.merge(
    #         customer_name: customer_name,
    #         customer_address: customer_address
    #       )
    #     end.map.with_index do |order, index|
    #       order.merge(orders_with_restaurant_address[index])
    #     end
        
    #   when 'restaurant'
    #     orders = Order.where(restaurant_id: user_id)
        
    #   when 'courier'
    #     orders = Order.where(courier_id: user_id)
    #   else
    #     render json: { error: 'Invalid user type' }, status: :bad_request
    #     return
    #   end
      
    #   render json: { orders: customer_info }, status: :ok
    # end
    
    

    # POST /api/orders/:id/update_status
    def update_status
      new_status = params[:status]
      if @order.update(order_status: new_status)
        render json: { message: "Order status updated to #{new_status}" }, status: :ok
      else
        render json: { error: "Failed to update order status" }, status: :unprocessable_entity
      end
    end

    # GET /orders/1 or /orders/1.json
    def show
    end

    # GET /orders/new
    def new
      @order = Order.new
    end

    # GET /orders/1/edit
    def edit
    end

    # POST /orders or /orders.json
    def create
      @order = Order.new(order_params)

      respond_to do |format|
        if @order.save
          format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /orders/1 or /orders/1.json
    def update
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /orders/1 or /orders/1.json
    def destroy
      @order.destroy

      respond_to do |format|
        format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def order_params
        params.require(:order).permit(:restaurant_id, :customer_id, :order_status_id, :restaurant_rating)
      end
  end
end
