class Api::V1::JobsController < ApplicationController

  before_action :set_job, only: [:show,:update,:destroy]

  def index
    @Jobs = Job.all
    render json: @Jobs, status: 200
  end

  def show
    render json: @Job, status: 200
  end

  def create
    @Job = Job.create(body:"default body", title: "default title", industry:"default industry", job_type:"", status:"draft")
    UserJob.create(user_id:params["user_id"], job_id:@Job.id)
        render json: @Job, status: 201
  end

  def update 
    job_ids = User.find(params[:user_id]).job_ids
      if(!job_ids.include?(params['id'].to_i))
          user = User.find(params[:user_id])
          @Job.users << user
      end
      @Job.update(params)  
    render json: @Job, status: 200
  end

  def destroy
    @JobId = @Job.id
    @Job.destroy
    render json: { message: "removed" }, status: :ok
  end


  private
  def job_params
    params.permit(:id, :user_id, :body, :title, :industry)
  end

  def set_job
    @Job = Job.find(params[:id])
  end
end


