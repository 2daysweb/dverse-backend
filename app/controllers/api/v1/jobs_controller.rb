require 'byebug'
class Api::V1::JobsController < ApplicationController

  before_action :set_job, only: [:show,:update,:destroy]

  def index
    @Jobs = Job.all
    render json: @Jobs, status: 200
  end

  def create
    @Job = Job.create(body:"Default Body", title: "Default Title", industry:"Default Industry", status:"draft", job_type:"")
    UserJob.create(user_id:params["user_id"], job_id:@Job.id)
        render json: @Job, status: 201
  end

  #
  def update   
    @Job.update(body: params[:body])
    @Job.update(title: params[:title])
    @Job.update(status: params[:status])
    job_ids = User.find(params[:user_id]).job_ids
    
      if(!job_ids.include?(params['id'].to_i))
          user = User.find(params[:user_id])
          @Job.users << user
      end
    render json: @Job, status: 200
  end

  def destroy
    @JobId = @Job.id
    @Job.destroy
    render json: { message: "removed" }, status: :ok
  end

  def show
    render json: @Job, status: 200
  end

  private
  #Temporarily removed require from job_ .... 
  def job_params
    params.permit(:title, :body, :id, :industry, :user_id)
  end

  def set_job
    @Job = Job.find(params[:id])
  end
end


