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
		resources :admins, only: [:index, :new, :create, :edit, :update, :delete]
		resources :items
		resources :artists
		resources :users, only: [:index, :show, :edit, :update]
	end

    root to: 'user/users#top'

	namespace :user, path: 'user' do
		resources :items, only: [:index, :show]
		resources :artists, only: [:index :show]
		resources :genres, only: [:index :show]
    end


		resources :items, only: [:index]
		# get 'top' => 'users#top'
		scope module: :user do
			resources :users, only: [:show]
		end

		devise_scope :social_account do
			get 'sign_out', to: "sessions#destroy"
		end

	end
