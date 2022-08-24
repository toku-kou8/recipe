Rails.application.routes.draw do
  devise_for :customer, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
  }
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  root to: 'public/homes#top'
  scope module: public {
    resources :recipe
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
