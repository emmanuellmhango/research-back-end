class Api::V1::JobsController < ApplicationController
  before_action :set_api_v1_job, only: %i[ show update destroy ]

  # GET /api/v1/jobs
  def index
    begin
      @api_v1_jobs = Job.all
      if @api_v1_jobs.present?
        render json: { success: true, jobs: @api_v1_jobs }
      else
        render json: { success: false }
      end
    rescue StandardError => e
      render json: { code: 201, message: e.message }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/jobs/1
  def show
    render json: @api_v1_job
  end

  # GET /api/v1/jobs/1/show_applicants
  def show_applicants
    @job = Job.find(params[:id])
    @applicants = @job.jobapplications.includes(user: :skills)
    @users = @applicants.map(&:user)
  
    users_with_skills = @users.map do |user|
      skills = user.skills.map(&:skname).join(", ")
      { id: user.id, name: "#{user.first_name} #{user.last_name}", email: user.email, phone: user.phone, skills: skills }
    end
  
    render json: { users: users_with_skills }
  end
  

  # GET /api/v1/jobs/1/show_applicant_count
  def show_applicant_count
    @job = Job.find(params[:id])
    applicants_count = @job.jobapplications.count

    render json: { applicants: applicants_count }
  end

  # POST /api/v1/jobs
  def create
    @api_v1_job = Job.new(api_v1_job_params)

    if @api_v1_job.save
      render json: @api_v1_job, status: :created
    else
      render json: @api_v1_job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/jobs/1
  def update
    if @api_v1_job.update(api_v1_job_params)
      render json: @api_v1_job
    else
      render json: @api_v1_job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/jobs/1
  def destroy
    @api_v1_job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_job
      @api_v1_job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_job_params
      params.require(:job).permit(:title, :position, :description, :required_education, :needed_skills, :closing_date, :company_id)
    end
end
