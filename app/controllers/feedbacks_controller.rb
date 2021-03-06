class FeedbacksController < ApplicationController
  before_action :authenticate_attendee!

  def new
    @feedback = Feedback.new
  end

  def create
    current_attendee.create_feedback!(feedback_params) unless current_attendee.feedback.present?
    redirect_to(root_path, notice: "Thanks for leaving your feedback!")
  end

  private

  def feedback_params
    params.require(:feedback).permit(:testimonial, :private_feedback)
  end
end
