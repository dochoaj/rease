class PresentationController < ApplicationController
	before_action :set_presentation, except: [:estatutos]
	add_breadcrumb "Inicio", :root_path
	
	def index
	end

	def searchPage
		add_breadcrumb "Búsqueda"
		if params[:search]
			@sections = Section.search(params[:search]).order("created_at DESC")
			@interest_links = InterestLink.search(params[:search]).order("created_at DESC")
			@events = Event.search(params[:search]).order("created_at DESC")
			@minutes = Minute.search(params[:search]).order("created_at DESC")
			@institutions = Institution.search(params[:search]).order("created_at DESC")
		else
			@sections = Section.all.order('created_at DESC')
			@interest_links = InterestLink.search(params[:search]).order("created_at DESC")
			@events = Event.search(params[:search]).order("created_at DESC")
			@minutes = Minute.search(params[:search]).order("created_at DESC")
			@institutions = Institution.search(params[:search]).order("created_at DESC")
			
		end
	end
	def somos
		add_breadcrumb "¿Quiénes Somos?", :presentation_somos_path 
		@instituciones = Institution.order("name ASC").all
	end

	def hacemos
		add_breadcrumb "¿Qué hacemos?", :presentation_hacemos_path
		@minutes = Minute.order("created_at DESC").all
	end

	def aprendizaje
		add_breadcrumb "¿Qué es A+S?", :presentation_aprendizaje_path
	end

	def estatutos
		add_breadcrumb "Estatutos", :presentation_estatutos_path
		@events = Event.all
    	@interest_links = InterestLink.order("name ASC").all
    	@sections = Section.all
	end

	private

	def set_presentation
		@events = Event.all
    	@interest_links = InterestLink.order("name ASC").all
    	@sections = Section.order("created_at DESC").all
	end
end
