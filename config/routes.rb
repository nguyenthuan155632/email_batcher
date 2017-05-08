Rails.application.routes.draw do
  resources :email_templates
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/customers/send_single_mail', to: 'customers#send_single_mail'
  post '/customers/send_multi_mail', to: 'customers#send_multi_mail'
  post '/customers/send_all_mail', to: 'customers#send_all_mail'
  post '/customers/import', to: 'customers#import'

  post '/email_templates/choose_template', to: 'email_templates#choose_template'
end
