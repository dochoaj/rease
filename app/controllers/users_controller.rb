class UsersController < ApplicationController
	before_action :authenticate_user!
	add_breadcrumb "Inicio", :root_path
  	add_breadcrumb "Perfil", :users_path

	def index
		@user = current_user
		add_breadcrumb "Mi perfil"
	end

	def show
		@user = User.find(params[:id])
		add_breadcrumb "Perfil de "+@user.name
	end
end
