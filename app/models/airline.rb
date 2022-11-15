class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers,   through: :flights

  def only_adults
    passengers.where("age >= 18").distinct.pluck(:name)
  end
end
