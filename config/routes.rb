Rails.application.routes.draw do
  get 'messages/create'
  root 'welcome#home'
  devise_for :customers
  devise_for :resellers

  resources :resellers, :customers, :conversations, :messages
end
