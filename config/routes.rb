Rails.application.routes.draw do

  resources :patients do
    resources :prescriptions do
      resources :pa_requests do
        resource :request_pages
      end
    end
  end

  resources :pa_requests, :only => [:index]
  resource :request_pages, :only => [:show, :create]

  root 'home#index'

  get '/dashboard' => 'pa_requests#index'

  get '/help' => 'home#help'

  get '/api' => redirect("https://api.covermymeds.com/#overview"), :as => :api_documentation

end
