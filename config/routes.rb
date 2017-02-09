Rails.application.routes.draw do
  resources :payslips do
    collection do
      get :input
      post :output
    end
  end

  root 'payslips#input'
end
