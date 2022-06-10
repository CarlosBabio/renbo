class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params["q"]
        redirect_to root_path unless params["q"] =~ /(\w|\d)+/
        @events = Event.where("address iLIKE ?", "%#{params['q']}%")
                        .or(Event.where("name iLIKE ?", "%#{params['q']}%"))
                        .or(Event.where("category iLIKE ?", "%#{params['q']}%"))
                        .or(Event.where("music_genre iLIKE ?", "%#{params['q']}%"))
                      #  .or(Event.where("artist iLIKE ?", "%#{params['q']}%"))
                      # ^^^ need to add artist to db ^^^
                        .or(Event.where("city iLIKE ?", "%#{params['q']}%"))
        end
    # else redirect_to root_path
    end

  def show
    @event = Event.find(params[:id])

    # Putting all the tokens of all tickets into an array
    @tokens = @event.all_tokens

    @markers = [{
          lat: @event.latitude,
          lng: @event.longitude,
          # info_window: render_to_string(partial: "info_window", locals: { event: @event })
    }]

  end
end
