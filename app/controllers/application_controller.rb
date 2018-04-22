class ApplicationController < Sinatra::Base

  configure do
  	set :views, "app/views"
    set :public_dir, "public"
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
  	erb :index
  end

  helpers do
    def logged_in?
      !!session[:student_id]
    end

    def current_user
      Student.find(session[:student_id])
    end
  end
end
