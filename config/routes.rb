# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get 'ideas', to: 'ideas#index'
      get 'ideas/:category_name', to: 'ideas#show'
      post 'ideas/:category_name', to: 'ideas#create'
    end
  end
end
