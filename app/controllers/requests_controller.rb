class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_category, except: [:index, :show]
  before_action :set_request, only: [:show, :edit, :update]
  
  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Solicitudes", :requests_path
  
  def index
    @requests = Request.all
  end

  def show
    add_breadcrumb "Mostrar"
  end

  def edit
    add_breadcrumb "Editar"
   
    if @request.user_id != current_user.id && current_user.category != 1
      redirect_to root_path, alert: "Usted no es el creador de la solicitud, por lo que no puede modificarla. Contáctese con su administrador."
    end
  end

  def new
    add_breadcrumb "Nueva solicitud"
    @request = Request.new
  end

  def create
    @request = Request.new(defined_params)
    @request.user_id = current_user.id
    @request.status = "Disponible"
    if @request.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def update
    if @request.update_attributes(defined_params)
     redirect_to :action => 'show', :id => @request
    else
     render :action => 'edit'
    end
  end

  def destroy
    puts "asd"
    Request.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

private
  
  def validate_category
      if current_user.category == 2
          redirect_to root_path, alert: "Su categoría de profesor no permite ésta acción."
      end   
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  def defined_params
    params.require(:request).permit(:id, :title, :description, :user_id, :status, :start_time, :end_time)
  end

end