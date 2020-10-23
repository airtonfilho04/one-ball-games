Rails.application.routes.draw do
  devise_for :admins
  resources :games
  get 'inicio', to: 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/game/:id', to: 'dashboard#show', as: 'dashboard_show'
  root 'dashboard#index'

  #api routes
  namespace 'api' do
    namespace 'v1' do
      resources :games
      get 'games/n/:name', to: 'games#find_by_name'
      get 'games/g/:genre', to: 'games#find_by_genre'
      get 'games/p/:plaform', to: 'games#find_by_platform'
    end
  end
end
