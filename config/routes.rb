Rails.application.routes.draw do
  devise_for :admins, path: 'admin/admins', controllers: {
	  sessions:      'admin/admins/sessions',
	  passwords:     'admin/admins/passwords',
	  registrations: 'admin/admins/registrations'
	}
	devise_for :users, controllers: {
	  sessions:      'user/users/sessions',
	  passwords:     'user/users/passwords',
	  registrations: 'user/users/registrations'
	}


	namespace :admin, path: 'admin' do
		root 'home#index', as: :root
		resources :admins, only: [:index, :new, :create, :edit]
		resources :items, only: [:index, :new, :create]
		resources :artists, only: [:index, :new, :create]
	end


	namespace :user, path: 'user' do
<<<<<<< HEAD
		resources :items, onry: [:index, :show]
		resources :artists, onry: [:index]
		resources :genres, onry: [:index]
    end
=======
		root 'users#top'
		resources :items, only: [:index]
		resources :users
		get 'top' => 'users#top'

		devise_scope :social_account do
			get 'sign_out', to: "sessions#destroy"
		end
	end
>>>>>>> change

end
