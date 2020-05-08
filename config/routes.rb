Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'home/get_form_data', to: 'home#get_form_data', as: :get_form_data
  get 'home/list_of_contact', to: 'home#list_of_contact', as: :list_of_contact
  post 'home/get_language', to: 'home#get_language'
  get '/store_language', to: 'home#store_language'
  root 'home#index'
end
