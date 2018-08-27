class User::ArtistsController < ApplicationController
	layout 'user'
	def index
	 @artist = Artist.search(params[:search])
	end
	def show
	 @artist = Artist.find(params[:id])
	end
end
