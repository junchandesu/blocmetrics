class RegisteredApplicationsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  def index
  	@apps = RegisteredApplication.all
  end

  def show
    @job_count = @app.jobs.count
    @jobs = @app.jobs.group_by(&:name)
  end

  def new
  	@app = RegisteredApplication.new
  end

  def create
  	@app = current_user.registered_applications.build(params_app)
  	@app.user = current_user
  	if @app.save
  		redirect_to @app, notice: "Application is registered."
  	else
  		flash[:error] = "Error saving application."
			render :new
	end
  end

  def edit

  end


  def update
  	if @app.update_attributes(params_app)
  		redirect_to @app, notice: "Application is updated."
  	else
  		redirect_to @app, error: "Error updating the application."
  	end
  end

  def destroy
  	if @app.destroy
  		redirect_to @app, notice: "#{@app.url} was deleted."
  	else
  		redirect_to @app, error: "Error deleting #{@app}"
  	end

  end
  private

  def params_app
  	params.require(:registered_application).permit(:name, :url)
  end

  def set_app
    @app = RegisteredApplication.find(params[:id])
  end
end
