class API::JobsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_filter :set_access_control_headers

 

	def create
		registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
   	    if registered_application.nil
			render json: "Unregistered application", status: :unprocessable_entity
	    else
	    	@job = job_params
	    	if @job.save
	    		 render json: @job, status: :created
	    	else
	    		 render @job.errors, status: :unprocessable_entity
			end
		end
	end

	private
	def job_params
		params.permit(:job_name)
	end

	 def set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end
end
