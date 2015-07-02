class RequestsController < ApplicationController
  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Solicitudes", :requests_path
  
  def index
    @requests = Request.all
  end

  def show
    add_breadcrumb "Mostrar"
    @request = Request.find(params[:id])
  end

  def edit
    add_breadcrumb "Editar"
    @request = Request.find(params[:id])
  end

  def new
    add_breadcrumb "Nueva solicitud"
    @request = Request.new
  end

  def create
    @request = Request.new(defined_params)
    @request.user_id = current_user.id
    if @request.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def update
    @request = Request.find(params[:id])
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

  def defined_params
    params.require(:request).permit(:id, :title, :description, :user_id, :status, :start_time, :end_time)
  end

end