Rails.application.routes.draw do
  resources(:flights,   only: [:index]) do
    resources(:flight_passengers,     only: [:destroy],     controller: "flight_passengers")
  end

  resources(:airlines,   only: [:show]) do
  end
end
