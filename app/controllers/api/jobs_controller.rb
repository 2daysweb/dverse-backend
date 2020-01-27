class Api::JobsController < ApplicationController
require "byebug"
  before_action :set_job, only: [:show,:update,:destroy]

  def index
    @Jobs = Job.all
    render json: @Jobs, status: 200
  end
  def show
    render json: @Job, status: 200
  end
  def create
    @Job = Job.create(body:"default body", title: "default title", industry:"default industry", job_type:"", status:"drafted")
    UserJob.create(user_id:job_params["user_id"], job_id:@Job.id)
    UserJob.create(user_id:1, job_id:@Job.id)
        render json: @Job, status: 201
  end
  def update 
    job_ids = User.find(job_params[:user_id]).job_ids
      if(!job_ids.include?(job_params['id'].to_i))
          user = User.find(job_params[:user_id])
          @Job.users << user
      end
    render json: @Job, status: 200
  end
  def destroy
    @id = @Job.id
    Job.destroy(@id)
    render json: { message: "removed" }, status: :ok
  end
  def set_job
    @Job = Job.find(job_params[:id])
  end
  private
  def job_params
    params.permit(:id, :body, :title, :industry, :status, :user_id)
  end
end


