class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method    

    def create
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: restaurant_pizza, status: :created
    end 

    private    
    def restaurant_pizza_params
        params.permit(:restaurant_id, :pizza_id, :price)
    end

    def unprocessable_entity_method(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

end
