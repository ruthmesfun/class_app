require 'sinatra'
require 'rest-client'
require 'json'
require 'bundler/setup'

class ApplicationController < Sinatra::Base
  configure do
  	set :views, "app/views"
    set :public_dir, "public"
    enable :sessions
    set :session_secret, "secret"
  end

  # get "/" do
  # 	# erb :index
  # end

  get '/' do
    erb :index, :locals => {:client_id => CLIENT_ID}
  end

  get '/callback' do 
    # get temporary GitHub code...
    session_code = request.env['rack.request.query_hash']['code']

    # ... and POST it back to GitHub
    result = RestClient.post('https://github.com/login/oauth/access_token',
                            {:client_id => ENV['CLIENT_ID'],
                            :client_secret => ENV['CLIENT_SECRET'],
                            :code => session_code},
                            :accept => :json)

    # extract token and granted scopes
    access_token = JSON.parse(result)['access_token']
    scopes = JSON.parse(result)['scope'].split(',')


    # check if we were granted user:email scope
    has_user_email_scope = scopes.include? 'user:email'

    # fetch user information
    auth_result = JSON.parse(RestClient.get('https://api.github.com/user',
                                            {:params => {:access_token => access_token},
                                            :accept => :json}))

    # if the user authorized it, fetch private emails
    if has_user_email_scope
      auth_result['private_emails'] =
        JSON.parse(RestClient.get('https://api.github.com/user/emails',
                                  {:params => {:access_token => access_token},
                                  :accept => :json}))
    end
    
    @student = Student.find_by(username: auth_result["login"])

    if @student
        session[:student_id] = @student.id 
        # raise session.inspect 
        redirect "/profile", :locals => auth_result
    
    else 
        @student = Student.create(first_name: auth_result["name"], username: auth_result["login"], image: auth_result["avatar_url"], github: auth_result["html_url"])
        session[:student_id] = @student.id 
        # raise session.inspect 
        redirect "/profile", :locals => auth_result
    end
    #     elsif 
    #   if @student.valid?
    #     session.clear
    #     session[:student_id] = @student.id
    #     redirect to "/questions"
    #   else
    #     redirect "/signup"
    #   end
    # else
    #   redirect '/login'
    # end

  end


  get '/test' do 
    erb :test
  end

  helpers do
    def logged_in?
      !!session[:student_id]
    end

    def current_user
      Student.find(session[:student_id])
    end

    def current_question
      Question.find(session[:question_id])
    end
    
  end
end
