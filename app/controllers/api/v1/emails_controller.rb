class Api::V1::EmailsController < ApplicationController
  def send_email_for_interview
    name = params[:name]
    email = params[:email]
    position = params[:position]
    company = params[:company]

    # Render the email template
    email_body = render_to_string(
      template: "my_mailer/interview_invitation_email.html.erb",
      locals: {
        name: name,
        position: position,
        company: company
      }
    )

    # Save the email content to a file
    File.open("tmp/interview_email.html", "w") do |file|
      file.write(email_body)
    end

    # Return a successful response
    render json: { message: "Email sent" }
  end
end
