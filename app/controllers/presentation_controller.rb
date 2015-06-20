class PresentationController < ApplicationController
  def index
    @secciones = Section.all
  end

  def contacto
  end

  def somos
  end

  def hacemos
  end

  def aprendizaje
  end

  def estatutos
  end
end
