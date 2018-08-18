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
		resources :artists, only: [:index, :show]
		resources :genres, only: [:index, :show]
		resources :carts, only: [:show, :update, :delete]
    end
        #お気に入り機能実装routing
        resource :sessions, only: [:new, :create, :destroy]
        resources :users #追加分

		resources :items do
		    member do #本一覧画面からお気に入り登録をする
		      post "add", to: "user/favorites#create"
		    end
		  end
		  #個人ページからお気に入りを削除する
	    resources :favorites, only: [:show, :destroy]
	    #お気に入り機能実装ーーーーーー



		resources :items, only: [:index]
		scope module: :user do
			resources :users, only: [:show, :edit]
		end
		# get 'top' => 'users#top'

		devise_scope :social_account do
			get 'sign_out', to: "sessions#destroy"
		end

	end
