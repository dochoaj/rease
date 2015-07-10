class OfferingsController < ApplicationController
  before_action :set_offering, only: [:show, :edit, :update, :destroy]
 
  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Ofertas", :offerings_path

  # GET /offerings
  # GET /offerings.json
  def index
    @offerings = Offering.all
  end

  # GET /offerings/1
  # GET /offerings/1.json
  def show
    add_breadcrumb "Mostrar"
  end

  # GET /offerings/new
  def new
    add_breadcrumb "Nueva oferta"
    @offering = Offering.new
  end

  # GET /offerings/1/edit
  def edit
    add_breadcrumb "Editar"
  end

  # POST /offerings
  # POST /offerings.json
  def create
    @offering = Offering.new(offering_params)
    @offering.user_id = current_user.id
    @offering.status = "Disponible"
    respond_to do |format|
      if @offering.save
        format.html { redirect_to @offering, notice: 'La oferta de servicio ha sido creada correctamente.' }
        format.json { render :show, status: :created, location: @offering }
      else
        format.html { render :new }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offerings/1
  # PATCH/PUT /offerings/1.json
  def update
    respond_to do |format|
      if @offering.update(offering_params)
        format.html { redirect_to @offering, notice: 'La oferta de servicio ha sido actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @offering }
      else
        format.html { render :edit }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offerings/1
  # DELETE /offerings/1.json
  def destroy
    @offering.destroy
    respond_to do |format|
      format.html { redirect_to offerings_url, notice: 'Se ha eliminado la oferta de servicio.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offering
      @offering = Offering.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offering_params
      params.require(:offering).permit(:user_id, :experience_id, :community_id, :area_id, :title, :description, :status, :start_time, :end_time)
    end
end
