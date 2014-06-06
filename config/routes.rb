Rails.application.routes.draw do
  resources :tasks

  match "home" => "home#show", via: :get
  root "home#show"
end
