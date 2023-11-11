Rails.application.routes.draw do
  get 'main/index'
  root to: 'main#index'
  # get '/main', to: 'main#index', format: [:html, :xml, :json]
end
