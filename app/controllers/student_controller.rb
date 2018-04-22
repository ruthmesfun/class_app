class StudentController < ApplicationController

    get '/login' do
        erb :'students/login'
    end

    post '/login' do
        @student = Student.find_by(username: params[:username])
        if @student && @student.authenticate(params[:password])
            session[:student_id] = @student.id 
            redirect "/profile"
        else 
            redirect '/login'
        end
    end

    get '/signup' do
        erb :'students/signup'
    end

    post '/signup' do 
        @student = Student.create(first_name: params[:first_name], username: params[:username], password: params[:password], image: params[:image], github: params[:github])
        if @student.valid?
            @student.save
            session[:student_id] = @student.id
            redirect to "/profile"
        else
            redirect "/signup"
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end

    get "/profile" do #can't get it to customize url
        @student = Student.find_by(username: params[:username])

        erb :'students/profile'
    end

    get '/profile/edit' do #This edit route is not working
        @student = Student.find_by(id: current_user.id)

        erb :"students/edit"
    end
    patch '/profile' do
        @student = Student.find_by(id: current_user.id)
        @student.update(first_name: params[:first_name], image: params[:image], github: params[:github])
        @student.save 

        erb :'students/profile'
    end



end