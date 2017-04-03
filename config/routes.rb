Rails.application.routes.draw do
  root to: 'games#new'
  #get '/play' => 'games#play'
  namespace :games do
    get :play
    patch :make_move
  end
  resources :games  
  #   patch :make_move
  # end
  
end
