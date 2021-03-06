class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :listado, :show]
  before_action :validate_category, except: [:index, :show, :listado]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Eventos", :events_path

  # GET /events
  # GET /events.json
  def index
    @events = Event.order("end_time DESC").all
  end

  def listado
    @events = Event.order("end_time DESC").all
    if params[:search]
      @events = Event.search(params[:search]).order("end_time DESC")
    else
      @events = Event.order("end_time DESC").all
    end
  end
  # GET /events/1
  # GET /events/1.json
  def show
    add_breadcrumb "Mostrar"
    @comment = Comment.new
  end

  # GET /events/new
  def new
    add_breadcrumb "Nuevo evento"
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    add_breadcrumb "Editar"

  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.new(event_params)
    @event.status = "Vigente"

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'El evento se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'El evento se ha modificado exitosamente.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'El evento se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def validate_category
      if current_user.category != 1
          redirect_to root_path, alert: "Sólo un administrador puede trabajar los eventos."
      end 
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:user_id, :title, :description, :address, :start_time, :end_time, :status)
    end
    
end
