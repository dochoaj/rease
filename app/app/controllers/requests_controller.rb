class RequestsController < ActionController::Base

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def edit
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(defined_params)
    if @request.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def update
    @request = request.find(params[:id])
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
    params.require(:request).permit(:id, :title, :description, :user_id)
  end

end