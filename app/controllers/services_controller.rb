class ServicesController < ApplicationController
	before_action :set_service, only: [:update, :destroy]
	before_action :set_status, only: [:index, :update, :create]
	before_action :validate_category_new, only: [:new]
	before_action :validate_professor , only: [:edit,:destroy]
	before_action :validate_owner, only: [:new]


	add_breadcrumb "Inicio", :root_path
	add_breadcrumb "Servicio", :services_path
	def index

	end
	def index_activos
		@activos = Service.where(status: 2).order("updated_at DESC")
	end

	def show
		@comment = Comment.new
		@service = Service.find(params[:id])
		@experience = @service.experiences.last
		add_breadcrumb "Mostrar"
	end

	def new
		@publication = publication
		@service = @publication.services.new
		if @publication.services.where(:creator_id => current_user.id).present?
			redirect_to publication_url(publication), alert: "Ya ha generado una petición para esta publicación"
		end

		add_breadcrumb "Solicitar participación"
	end

	def edit
		@publication = publication
		@service = publication.services.find(params[:id])
		if current_user == @service.creator and @service.status != 2
			redirect_to root_path, alert: "No puede editar esta petición"
		end
	end

	def create
		@publication = publication
		@service = @publication.services.new(service_params)
		@service.creator = current_user
		@service.title = @publication.title
		@service.area = @publication.area
		@service.description = @publication.description
		@service.resume = @publication.resume
		@service.start_time = @publication.start_time
		@service.end_time = @publication.end_time
		@service.status = 1

		respond_to do |format|
			if @service.save
				format.html { redirect_to publication_url(publication), notice: 'Se ha enviado su petición.' }
				format.json { render :show, status: :created, location: @service }
			else	
				format.html { render :new }
				format.json { render json: @service.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@publication = publication
		@service = @publication.services.find(params[:id])
			respond_to do |format|
			if @service.update(service_params)
				@publication.update(status: 4)
				format.html { redirect_to publication_url(publication), notice: 'Se ha entregado su respuesta' }
				format.json { render :show, status: :ok, location: @service }
			else
				format.html { render :edit }
				format.json { render json: @service.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@service.destroy
			respond_to do |format|
			format.html { redirect_to services_url, notice: 'El servicio se ha eliminado correctamente.' }
			format.json { head :no_content }
		end
	end

	def searchService
		add_breadcrumb "Búsqueda"
		@service = Service.where(status: 2).order("created DESC")
		if params[:search]
			@services = Service.where(status: 2).search(params[:search]).order("updated_at DESC")
		else
			@service = Service.where(status: 2).order("created DESC")
		end
	end

	private
		def publication
			if params[:request_id]
				id = params[:request_id]
				Request.find(params[:request_id])     
			else
				id = params[:offering_id]
				Offering.find(params[:offering_id])
			end
		end 

		def publication_url(publication)
			if Request === publication
				request_path(publication)      
			else
				offering_path(publication)
			end
		end

		def validate_category_new
			if Request === publication
				if current_user.category == 3 || current_user.category == 4
					redirect_to root_path, alert: "Solo un profesor puede pedir trabajar en esta solicitud de servicio."
				end
			else
				if current_user.category == 2 || current_user.category == 3
					redirect_to root_path, alert: "Solo un socio comunitario puede pedir trabajar en esta oferta de servicio."
				end       
			end
		end

		def validate_professor
			if current_user.category != 2 and current_user.category != 1
				redirect_to root_path, alert: "Solo un profesor puede editar una solicitud"
			end
		end

		def validate_owner
			if current_user == publication.user
				redirect_to root_path, alert: "No puede generar una petición para su propia publicación"
			end			
		end

		def set_status
			@publication = publication
			@services = publication.services.all
			@pendientes = @services.where(status: 1).order("updated_at DESC")
			@aceptados = @services.where(status: 2).order("updated_at DESC")
			@rechazados = @services.where(status: 3).order("updated_at DESC")
		end	

		def set_service
			@service = Service.find(params[:id])
		end

		def service_params
			params.require(:service).permit(
				:publication_id,
				:publication_type,
				:creator_id,
				:acceptor_id,
				:institution_id,
				:area_id,
				:description,
				:resume,
				:start_time,
				:end_time,
				:title,
				:message,
				:status,
				:objectives)
		end
end
