class RestaurantsController < ApplicationController
    def index
        restaurant = Restaurant.all
        render json: restaurant
    end

    def show
        restaurant = find_restaurant
        if restaurant
            render json: restaurant, serializer: SingleRestaurantSerializer
        else
            render_errors
        end
    end

    def destroy
        restaurant = find_restaurant
        if restaurant
            restaurant.destroy
            head :no_content
        else
            render_errors
        end
    end

    private
    def find_restaurant
        Restaurant.find_by(id: params[:id])
    end

    def render_errors
        render json: { error: "Restaurant not found" }, status: :not_found
    end
end
