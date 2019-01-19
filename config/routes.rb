Rails.application.routes.draw do
  resources :shortened_urls, only: [:create]
  root to: 'shortened_urls#new'
  get '/:token', to: 'shortened_urls#redirect_token', :as => :shortened_url
end
