require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  delete '/drawing/:id' do
    @drawing_object = Drawing.delete(params[:id])
    redirect to("/")
end


  get '/' do
      erb :welcome
    end



  helpers do
    def redirect_if_not_logged_in
        if !logged_in?
          redirect "/login?error= Please log in to continue!"
        end
    end

    def logged_in?
      !!current_artist
    end

    def current_artist
      @current_artist ||= Artist.find_by(id: session[:artist_id]) if session[:artist_id]
    end
  end
end
