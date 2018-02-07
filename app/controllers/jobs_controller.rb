class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]
  before_action :set_company, only: [:destroy, :edit, :update, :create, :new]
  before_action :set_categories, only: [:new, :create, :edit]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = @company.jobs.new(job_params)
    @category = Category.find(params[:job][:category_id])
    @job.category_id = @category.id
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
  end

  def update
    @job.update!(job_params)
    flash[:success] = "You have successfully edited #{@job.title}"
    redirect_to company_job_path(@company, @job)
  end

  def destroy
    @job.destroy
    flash[:success] = "You have Successfully Deleted the Job #{@job.title}"
    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_categories
    @categories = Category.all
  end
end
