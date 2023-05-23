class Api::V1::EmailsController < ApplicationController
    def send_email_for_interview
      email = params[:email]
      name = params[:name]
      position = params[:position]
      company = params[:company]
  
      MyMailer.interview_invitation_email(name, email, position, company).deliver_now
  
      render json: { message: 'Email sent' }
    end
end