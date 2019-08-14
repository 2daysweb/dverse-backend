require 'byebug'
class Api::V1::JobPostingsController < ApplicationController

  before_action :set_job_posting, only: [:show,:update,:destroy]

  def index
    @JobPostings = JobPosting.all
    render json: @JobPostings, status: 200
  end


  #Hardcoded attribute values for New Job Posting here, rather than FETCH POST, ideally send "empty object" from frontend and use params here 
  def create
    @JobPosting = JobPosting.create(body:"Default Body", title: "Default Title", industry:"Default Industry", is_active:true, is_approved:true)
    # byebug
    render json: @JobPosting, status: 201
  end

  def update
    @JobPosting.update(body: params[:body])
    @JobPosting.update(title: params[:title])
    render json: @JobPosting, status: 200
  end

  def destroy
    @JobPostingId = @JobPosting.id
    @JobPosting.destroy
    render json: { message: "removed" }, status: :ok
  end

  def show
    render json: @JobPosting, status: 200
  end

  private
  #Temporarily removed require from job_posting .... 
  def job_posting_params
    params(job_posting).permit(:title, :body, :id, :is_active, :is_approved, :industry)
  end

  def set_job_posting
    @JobPosting = JobPosting.find(params[:id])
  end
end


