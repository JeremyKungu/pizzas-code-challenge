class RestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :restaurant_id, :pizza_id, :price

  has_one :pizza
end
