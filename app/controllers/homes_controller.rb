class HomesController < ApplicationController
  def show
    # # work in progress
    ###########################################################
    # create new event at a given time and date
    ###########################################################
    # current_time = Time.now
    # start_date = current_time.utc.iso8601
    #https://developers.google.com/schemas/formats/datetime-formatting
    start_date = '2017-01-13T01:15:03-08:00'
    end_date = '2017-01-13T23:15:03-08:00'

    @event = {
    'summary' => 'New Event Title',
    'description' => 'The description',
    'location' => 'Location',
    'start' => { 'dateTime' => start_date },
    'end' => { 'dateTime' => end_date },
    'attendees' => [ { "email" => 'bob@example.com' },
    { "email" =>'sally@example.com' } ] }

    client = Google::APIClient.new
    client.authorization.access_token = current_user.oauth_token
    service = client.discovered_api('calendar', 'v3')

    # @set_event = client.execute(:api_method => service.events.insert,
    #                       :parameters => {'calendarId' => 'primary', 'sendNotifications' => true},
    #                       :body => JSON.dump(@event),
    #                       :headers => {'Content-Type' => 'application/json'})



   ###########################################################
   # view all events
   ###########################################################


    calendars = client.execute(api_method: service.events.list,
                              :parameters => {'calendarId' => 'primary', 'sendNotifications' => true, timeMin: start_date, timeMax:end_date },
                              :headers => {'Content-Type' => 'application/json'}
                              )
    free_time = []
    previous_date = start_date.to_datetime.to_i

  (start_date.to_datetime.to_i .. end_date.to_datetime.to_i).step(1.hour) do |date|

    calendars.data.items.each do |event|
      if !(previous_date..date).overlaps?(event.start.dateTime.to_i .. event.end.dateTime.to_i)
        free_time << Time.at(previous_date)
        break
      end
    end
    previous_date = date
  end
  previous_hour = 3
  num_of_groups = 0
  group_of_hours = []
  free_time.each do |free_time_formatted|
    if (previous_hour+1) == free_time_formatted.hour
      num_of_hours ++
      group_of_hours[num_of_groups] << free_time_formatted
    else
      group_of_hours[num_of_groups] << num_of_hours
      num_of_hours = 0
      num_of_groups++
    end
    previous_hour = free_time_formatted.hour
  end
  p group_of_hours
  p "**************************"

  end
end
