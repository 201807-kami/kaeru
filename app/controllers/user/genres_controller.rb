class User::GenresController < ApplicationController
	layout 'user'
	def index
	end
	def show
      @genre = Genre.find(params[:id])
      @items = Item.where(recommended: params[:id])
	end
end