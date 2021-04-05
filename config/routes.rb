Rails.application.routes.draw do
  get 'messages/create'
  root 'welcome#home'
  devise_for :customers
  devise_for :resellers

  resources :resellers, :customers, :conversations, :messages

  patch :to_trash, to: 'conversations#to_trash', as: :to_trash
  patch :from_trash, to: 'conversations#from_trash', as: :from_trash

  post :black_list, to: 'blacklists#add_to_blacklist', as: :black_list
  post :remove_from_blacklist, to: 'blacklists#remove_from_blacklist', as: :remove_from_blacklist
end
