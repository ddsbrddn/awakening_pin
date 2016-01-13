Rails.application.routes.draw do

  resource :pins

  root "pins#index"
end
