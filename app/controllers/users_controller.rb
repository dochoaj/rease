class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :validate_category, only: [:edit,:update]
	before_action :set_user, only: [:show, :edit, :update]
	add_breadcrumb "Inicio", :root_path
  	add_breadcrumb "Perfil", :users_path

	def index
		@user = current_user
	end

	def listarUsuarios
		add_breadcrumb "Usuarios registrados"
		@user = User.all
	end
	
	def show
		add_breadcrumb "Perfil de "+@user.name
	end

	def edit
		add_breadcrumb "Editar perfil de "+@user.name
	end

	def update
		if @user.update(section_params)
			flash[:notice] = "El usuario ha sido actualizado correctamente"
			redirect_to @user
		else
			flash[:alert] = "Ha ocurrido un error en la actualización del usuario"
			render :edit
		end
	end
	
	private

	def validate_category
		if current_user.category != 1
			redirect_to root_path, alert: "Solo el administrador tiene este privilegio"
		end   
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find(params[:id])
	end
	
	def section_params
		params.require(:user).permit(:category,:autorization_level)
	end
end
