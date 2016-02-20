class MeetingInvitationMailer < ActionMailer::Base
  include EmailHeaderHelper
  include ApplicationHelper

  helper ApplicationHelper

  def attending meeting, member, invitation
    @member = member
    @meeting = meeting
    @host_address = AddressDecorator.new(@meeting.venue.address) 

    subject = "See you at #{@meeting.name} on #{humanize_date(@meeting.date_and_time)}"
    mail(mail_args(member, subject)) do |format|
      format.html
    end
  end
end
