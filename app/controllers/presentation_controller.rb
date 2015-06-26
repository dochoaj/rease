class PresentationController < ApplicationController
	add_breadcrumb "Inicio", :root_path
	@events = Event.all
	def index
		@secciones = Section.all
	end

	def contacto
		add_breadcrumb "Contacto", :presentation_contacto_path
	end

	def somos
		add_breadcrumb "¿Quiénes Somos?", :presentation_somos_path 
		@secciones = Section.all
	end

	def hacemos
		add_breadcrumb "¿Qué hacemos?", :presentation_hacemos_path
		@secciones = Section.all
	end

	def aprendizaje
		add_breadcrumb "¿Qué es A+S?", :presentation_aprendizaje_path
		@secciones = Section.all
	end

	def estatutos
		add_breadcrumb "Estatutos", :presentation_estatutos_path
		@secciones = Section.all
	end
end
