Rails.application.routes.draw do

  resources :patients do
    resources :prescriptions do
      resources :pa_requests
    end
  end

  
  resources :pa_requests, :only => [:index]

  root 'home#index'

  get '/dashboard' => 'pa_requests#index'
  
  get '/help' => 'home#help'

  get '/api' => redirect("https://api.covermymeds.com/#overview"), :as => :api_documentation

end
