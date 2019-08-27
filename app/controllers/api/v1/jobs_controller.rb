require 'byebug'
class Api::V1::JobsController < ApplicationController

  before_action :set_job, only: [:show,:update,:destroy]

  def index
    @Jobs = Job.all
    render json: @Jobs, status: 200
  end


  #Hardcoded values for New Job  here, rather than FETCH POST, ideally send "empty object" from frontend and use params here 
  def create
    @Job = Job.create(body:"Default Body", title: "Default Title", industry:"Default Industry", is_active:true, is_approved:true, job_type:"")
    # byebug
    render json: @Job, status: 201
  end

  def update
    @Job.update(body: params[:body])
    @Job.update(title: params[:title])
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
    params(job).permit(:title, :body, :id, :is_active, :is_approved, :industry)
  end

  def set_job
    @Job = Job.find(params[:id])
  end
end


