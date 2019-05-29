Rails.application.routes.draw do
 
  get 'sessions/new'

  root 'tests#index'
  
  get 'users/new'

  get :index , to: 'public#index'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :destroy_session, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

    resources :tests do
        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index 
        end

        member do
          post :start
        end
    end

    # GET /test_passages/101/result
   resources :test_passages, only: %i[show update] do
    # используем member т.к. метод result относится не к коллекции,
    # а к конкретному ресурсу
    member do
      get :result 
    end
  end

end
