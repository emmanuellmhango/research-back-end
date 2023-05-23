class MyMailer < ActionMailer::Base
    def interview_invitation_email(name, email, position, company)
        @name = name
        @position = position
        @company = company
        @email = email
        mail(to: @email, subject: "INTERVIEW SCHEDULE FOR POSITION OF #{@position}")
    end
end
  
