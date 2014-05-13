class FeedbacksController < ApplicationController
  before_action :authenticate_attendee!

  def new
    @feedback = Feedback.new
  end

  def create
    current_attendee.feedbacks.create!(feedback_params) unless current_attendee.has_feedback?
    redirect_to(root_path, notice: "Thanks for leaving your feedback!")
  end

  private

  def feedback_params
    params.require(:feedback).permit(:testimonial, :private_feedback)
  end
end
