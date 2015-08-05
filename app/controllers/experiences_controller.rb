class ExperiencesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_realizado
	before_action :set_experience, only: [:show, :edit, :update, :destroy]
	before_action :set_institutionsAndAreas
	before_action :validate_category, except: [:show]


	add_breadcrumb "Inicio", :root_path
	add_breadcrumb "Experiencias", :experiences_path

	def index
		@experiences =Experience.all
	end

	def new
		@experience = Experience.new
		@offering = Offering.where("status = ? and user_id = ?",3,current_user.id)
		@request = Request.where("status = ? and user_id = ?",3,current_user.id)
	end
	# GET /experiences/1/edit
	def edit
		add_breadcrumb "Editar"
	end

	def show
		@experience = Experience.find(params[:id])
	end

	# POST /experiences
	# POST /experiences.json
	def create
	@experience = current_user.experiences.new(experience_params)
	@experience.professor_name = current_user.name
	@experience.professor_email = current_user.email
		respond_to do |format|
			if @experience.save
				format.html { redirect_to @experience, notice: 'La experiencia se ha creado exitosamente.' }
				format.json { render :show, status: :created, location: @experience }
			else
				format.html { render :new }
				format.json { render json: @experience.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /experiences/1
	# PATCH/PUT /experiences/1.json
	def update
		respond_to do |format|
			if @experience.update(experience_params)
				format.html { redirect_to @experience, notice: 'La experiencia se ha modificado exitosamente.' }
				format.json { render :show, status: :ok, location: @experience }
			else
				format.html { render :edit }
				format.json { render json: @experience.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /experiences/1
	# DELETE /experiences/1.json
	def destroy
		@experience.destroy
		respond_to do |format|
			format.html { redirect_to experiences_url, notice: 'La experiencia se ha eliminado.' }
			format.json { head :no_content }
		end
	end

	def searchExperience
		add_breadcrumb "Búsqueda"
	    if params[:search]
	      @offerings = Offering.where("status = ?", 3).search(params[:search])
	      @requests = Request.where("status = ?", 3).search(params[:search])
	    else
			@offerings = Offering.where("status = ?", 3)
			@requests = Request.where("status = ?", 3)
	    end
	end
	
	private
	def validate_category
		if current_user.category != 2 && current_user.category != 1
			redirect_to root_path, alert: "Sólo un profesor puede trabajar las experiencias."
		end   
	end

	def set_realizado
		@offerings = Offering.where("status = ?", 3)
		@requests = Request.where("status = ?", 3)
	end
	def set_experience
		@experience = Experience.find(params[:id])
    end

    def set_institutionsAndAreas
    	@institutions = Institution.all
    	@areas = Area.all 	
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(
			:description,
			:user_id,
			:request_id,
			:folio,
			:offering_id,
			:institution_id,
			:faculty,
			:department,
			:course_name,
			:course_type,
			:period,
			:professor_name,
			:professor_email,
			:professor_phone,
			:professor_degree,
			:learning_objectives,
			:service_objectives,
			:institutional_support,
			:frequency,
			:weekly_hours,
			:participants,
			:students_level,
			:community_partner,
			:organization_type,
			:benefit,
			:results,
			:tools,
			:reflection_moments)
    end
end
