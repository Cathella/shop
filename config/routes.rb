Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :customers
  devise_for :resellers

  resources :resellers, :customers
end
