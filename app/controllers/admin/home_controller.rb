class Admin::HomeController < Admin::AdminBase
	def index
		render 'admin/home'
	end

end