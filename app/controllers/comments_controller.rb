class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @job = Job.find(params[:job_id])
    @comment.save
    redirect_to company_job_path(@job.company, @job)
  end

  private
  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end


end
