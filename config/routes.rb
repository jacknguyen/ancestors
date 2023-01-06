Rails.application.routes.draw do
  get :common_ancestors, to: 'common_ancestors#index'
  get :birds, to: 'birds#index'
  root 'common_ancestors#index'
end
