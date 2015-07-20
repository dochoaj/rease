class PresentationController < ApplicationController
	before_action :set_presentation
	add_breadcrumb "Inicio", :root_path
	
	def index
	end

	def somos
		add_breadcrumb "¿Quiénes Somos?", :presentation_somos_path 
		@instituciones = Institution.all
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
		
	end

	private

	def set_presentation
		@events = Event.all
    	@interest_links = InterestLink.order("name ASC").all
    	@sections = Section.order("created_at DESC").all
	end
end
