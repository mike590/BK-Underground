BrooklynUnderderground::Application.routes.draw do

  devise_for :admins, controllers: { registrations: 'registrations' }
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # devise_for :users, controllers: { registrations: 'registrations' }

  get 'venues'          => 'venues#index'

  # This is the webservice API, those methods returns JSON objects.
  # the 'collection' attribute creates a path with no :id (reports/generate_report instead of /reports/:id/generate_report)

  resources :venues do
    # post 'scan_for_new_publishers', on: :collection
    # get 'publisher_refresh_records', on: :member
  end

  # Root path, the empty page (see templates/index.html.haml)
  root to: 'venues#index'
  match '*path' => redirect('/'), via: :get
end
