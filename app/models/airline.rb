class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers,   through: :flights

  def only_fans_adults
    #get it?becasue its an airline
    passengers.where("age >= 18").distinct.pluck(:name)
  end
end
