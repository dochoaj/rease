class SectionsController < ApplicationController
	add_breadcrumb "Inicio", :root_path
	add_breadcrumb "Secciones", :sections_path

	def index
		@sections = Section.all
	end

	def novedades
		add_breadcrumb "Novedades", :sections_novedades_path
		@sections = Section.all
		@section = Section.new
	end

	def somos
		add_breadcrumb "¿Quienes Somos?", :sections_somos_path
		@sections = Section.all
		@section = Section.new
	end

	def hacemos
		add_breadcrumb "¿Qué hacemos?", :sections_hacemos_path
		@sections = Section.all
		@section = Section.new
	end

	def estatutos
		add_breadcrumb "Estatutos", :sections_estatutos_path
		@sections = Section.all
		@section = Section.new
	end

	def aprendizaje
		add_breadcrumb "Aprendizaje y Servicio", :sections_aprendizaje_path
		@sections = Section.all
		@section = Section.new
	end

	def linkInteres
		add_breadcrumb "link de Interés", :sections_linkInteres_path
		@sections = Section.all
		@section = Section.new
	end

	def new
		add_breadcrumb "Nueva sección", :new_section_path
		@section = Section.new
	end

	def show
		@section = Section.find(params[:id])
	end

	def create
		@section = Section.new(section_params)
		if @section.save
			redirect_to root_path
		else
			render :new #en caso de que no guarde redirecciona a la misma pagina
		end
	end

	def destroy
		@section = Section.find(params[:id])
		@section.destroy
		flash[:notice] = "La sección ha sido eliminada correctamente"
		redirect_to sections_path
	end

	def edit
		add_breadcrumb "Editar sección", :edit_section_path
		@section = Section.find(params[:id])
	end

	def update
		@section = Section.find(params[:id])
		if @section.update(section_params)
			flash[:notice] = "La sección ha sido actualizada correctamente"
			redirect_to @section
		else
			flash[:alert] = "Ha ocurrido un error en la actualización de la sección"
			render :edit
		end
	end

	private #acciones privadas del controlador

	def section_params
		params.require(:section).permit(:title,:body,:order,:priority)
	end
end
# get "/sections" index
# post "/sections" create
# delete "/sections/:id" delete (destroy)
# get "/sections/:id" show
# get "/sections/new" new
# get "/sections/:id/edit" edit
# patch "/sections/:id" update
# put "/sections/:id" update
