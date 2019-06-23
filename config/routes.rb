Rails.application.routes.draw do
 
  devise_for :users, controllers: {sessions: 'user/sessions'}
  
  root to: 'tests#index'
  

    resources :tests, only: :index do
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
        post :gist 
      end
   end

   namespace :admin do
      resources :tests do
        # on: :member нужно для того чтоб в url был идентификатор теста, с которым работаем
        patch :update_inline, on: :member
      
        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index 
        end
        member do
          post :start
        end
      end
        
        resources :gists, only: :index
    end
end
