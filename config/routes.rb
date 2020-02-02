Rails.application.routes.draw do
  devise_for :users, path: 'auth',
                     path_names: {
                       sign_in: 'login',
                       sign_out: 'logout',
                       registrations: 'signup'
                     },
                     controllers: {
                       registrations: 'registrations',
                       sessions: 'sessions',
                       passwords: 'passwords'
                     },
                     defaults: { format: :json }

  namespace :api do
    resources :movies, only: %i[index show]
  end
end
