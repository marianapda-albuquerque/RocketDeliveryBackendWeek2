class Api::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    rating = params[:rating].to_i || 1
    price_range = params[:price_range].to_i || 1

    if rating < 1 || rating > 5 || price_range < 1 || price_range > 3
      render json: { error: "Invalid rating or price range" }, status: :unprocessable_entity
    else
      @restaurants = Restaurant.with_rating_and_price_range(rating, price_range)
      render json: @restaurants
    end
  end
  

  def show
    render json: @restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      render json: @restaurant, status: :created, location: api_restaurant_url(@restaurant)
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    head :no_content
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:user_id, :address_id, :phone, :email, :name, :price_range, :active)
  end

  def self.with_rating_and_price_range(rating, price_range)
    where(rating: rating, price_range: price_range)
  end
end




# class Api::RestaurantsController < ApplicationController
#   before_action :set_restaurant, only: %i[ show edit update destroy ]

#   def self.with_rating_and_price_range(rating, price_range)
#     where(rating: rating, price_range: price_range)
#   end

#   # GET /restaurants or /restaurants.json
#   def index
#     rating = params[:rating].to_i || 1
#     price_range = params[:price_range].to_i || 1
  
#     if rating < 1 || rating > 5 || price_range < 1 || price_range > 3
#       render json: { error: "Invalid rating or price range" }, status: :unprocessable_entity
#     else
#       @restaurants = Restaurant.with_rating_and_price_range(rating, price_range)
#       render json: @restaurants
#     end
#   end

#   # GET /restaurants/1 or /restaurants/1.json
#   def show
#     render json: @restaurants
#   end

#   # GET /restaurants/new
#   def new
#     @restaurant = Restaurant.new
#   end

#   # GET /restaurants/1/edit
#   def edit
#   end

#   # POST /restaurants or /restaurants.json
#   def create
#     @restaurant = Restaurant.new(restaurant_params)

#     respond_to do |format|
#       if @restaurant.save
#         format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
#         format.json { render :show, status: :created, location: @restaurant }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @restaurant.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /restaurants/1 or /restaurants/1.json
#   def update
#     respond_to do |format|
#       if @restaurant.update(restaurant_params)
#         format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully updated." }
#         format.json { render :show, status: :ok, location: @restaurant }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @restaurant.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /restaurants/1 or /restaurants/1.json
#   def destroy
#     @restaurant.destroy

#     respond_to do |format|
#       format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_restaurant
#       @restaurant = Restaurant.find(params[:id])
#     end
    
#     # Only allow a list of trusted parameters through.
#     def restaurant_params
#       params.require(:restaurant).permit(:user_id, :address_id, :phone, :email, :name, :price_range, :active)
#     end
# end