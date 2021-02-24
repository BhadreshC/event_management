module EventsHelper
  #check event status
  def event_status(event)
    if (event.start_date..event.end_date).include?(Date.today)
      "On going"
    elsif event.end_date <= Date.today
      "Closed"
    else
      "Up coming"
    end
  end
end
