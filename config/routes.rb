Rails.application.routes.draw do
  match "home" => "home#show", via: :get
  root "home#show"
end
