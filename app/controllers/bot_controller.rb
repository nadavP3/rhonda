class BotController < ApplicationController
  include BotControllerHelper
  include BotControllerHelper2
  include BotController3Helper


  def index
    $rhonda = ApiAiRuby::Client.new(
    :client_access_token => "21136391b2cd47d7bbf7e5f7813287dc"
    )
  end

  def get_response
    ai_response = $rhonda.text_request params["user_input"]
     response = Response.api_distr(ai_response)


    # elsif response[:result][:action] == "getFreetime"
    #   response =
    #       {
    #         "speech": "#{get_freetime}"
    #       }
    # elsif response[:result][:action] == "getTv"
    #   $show = response[:result][:parameters][:show]
    #   response =
    #       {
    #         "speech": "#{get_tv($show)}"
    #       }
    #
    # elsif response[:result][:action] == "setEvent"
    #   title = response[:result][:parameters][:eventtitle]
    #   puts title
    #   if title == ""
    #     title = "event"
    #   end
    #
    #   location = response[:result][:parameters][:eventlocation]
    #   day = response[:result][:parameters][:eventstart]
    #   starttime = response[:result][:parameters][:eventtime].join.split[0..1]
    #   endtime = response[:result][:parameters][:eventtime].join.split[-2..-1]
    #
    #
    #   response = {
    #     "speech": "#{set_event(title, location, day, starttime, endtime)}"
    #     }
    #
    # elsif response[:result][:action] == "getAPIevent"
    #   $api_event_subject = response[:result][:parameters][:'APIevent-subject']
    #   $api_event_location = response[:result][:parameters][:'api_event_location']
    #
    #   response = {
    #     'speech': "#{get_event($api_event_subject, $api_event_location).sample}",
    #     'url': $event['venue_url']
    #   }
    #
    # elsif response[:result][:action] == "nextEvent"
    #   response = {
    #     'speech': "#{get_event($api_event_subject, $api_event_location).sample}",
    #     'url': $event['venue_url']
    #   }
    # elsif response[:result][:action] == 'setEventfulEvent'
    #   response = {
    #     'speech': "#{set_eventfull}"
    #   }
    # elsif response[:result][:action] == 'getGiph'
    #   $subject = response[:result][:parameters][:giphSubject]
    #   # debugger;
    #   response = {
    #     'gif': "#{get_giph($subject)}"
    #   }
    # elsif response[:result][:action] == "nextGiph"
    #   response = {
    #     'gif': "#{get_giph($subject)}"
    #   }
    # elsif response[:result][:action] == 'getRun'
    #   response = {
    #     'speech': "#{get_run.sample}"
    #   }
    # elsif response[:result][:action] == 'nextRun'
    #   response = {
    #     'speech': "#{next_run.sample}"
    #   }
    # elsif response[:result][:action] == 'setRun'
    #   time = response[:result][:parameters][:time]
    #   response = {
    #     'speech': "#{set_run(time)}"
    #   }
    # elsif response[:result][:action] == 'getMovieTickets'
    #   response = {
    #     'speech': "#{get_movie_theaters}"
    #   }
    # else
    #     response = response[:result][:fulfillment]
    # end

      render json: response
  end

end
