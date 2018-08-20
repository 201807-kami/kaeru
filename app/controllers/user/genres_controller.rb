class User::GenresController < ApplicationController
	def index
	end
	def show
      @genre = Genre.find(params[:id]).items
	end
end