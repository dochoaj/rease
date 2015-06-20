class SectionsController < ApplicationController

	def index
		@sections = Section.all
	end

	def new
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
		redirect_to sections_path
	end

	def edit
		@section = Section.find(params[:id])
	end

	def update
		@section = Section.find(params[:id])
		if @section.update(section_params)
			redirect_to @section
		else
			render :edit
		end
	end

	private #acciones privadas del controlador

	def section_params
		params.require(:section).permit(:title,:body,:order)
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