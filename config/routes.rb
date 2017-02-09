Rails.application.routes.draw do
  resources :payslips, only: [:index] do
    collection do
      post :upload
    end
  end

  root 'payslips#index'
end
