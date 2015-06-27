class PresentationController < ApplicationController
  def index
    @secciones = Section.all
  end

  def contacto

  end

  def somos
    @secciones = Section.all
  end

  def hacemos
    @secciones = Section.all
  end

  def aprendizaje
    @secciones = Section.all
  end

  def estatutos
    @secciones = Section.all
  end
end
