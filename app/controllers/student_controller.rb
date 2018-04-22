class StudentController < ApplicationController
    configure do 
        enable :sessions
        set :session_secret, "secret"
    end

    get '/profile' do
        @student = Student.find(session[:id])
        erb :'students/profile'
    end

    get '/signup' do
        erb :'students/signup'
    end

    post '/signup' do 
        @student = Student.create(params)
        if @student.valid?
            @student.save
            session[:id] = @student.id
            redirect to '/profile'
        else
            redirect '/signup'
        end
    end

end