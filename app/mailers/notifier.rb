class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def ticket_created(ticket)
    @ticket = ticket
    mail to: @ticket.email, subject: "Ticket #{@ticket.uid}"
  end

  def new_ticket_comment(ticket)
    @ticket = ticket
    mail to: @ticket.email, subject: "New comment for ticket #{@ticket.uid}"
  end
end
