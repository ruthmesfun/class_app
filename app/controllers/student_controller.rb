class StudentController < ApplicationController

    get '/login' do
        if logged_in?
            redirect '/profile'
        else
            erb :'students/login'
        end
    end

    post '/login' do
        @student = Student.find_by(username: params[:username])
        if @student && @student.authenticate(params[:password])
            session.clear
            session[:student_id] = @student.id 
            redirect "/profile"
        else 
            redirect '/login'
        end
    end

    get '/signup' do
        if logged_in?
            redirect '/profile'
        else
            erb :'students/signup'
        end
    end

    post '/signup' do 
        @student = Student.create(first_name: params[:first_name], username: params[:username], password: params[:password], image: params[:image], github: params[:github])
        if @student.valid?
            session.clear
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
        @student = current_user
        # binding.pry

        erb :'students/profile'
    end

    patch '/profile' do
        @student = current_user
        @student.update(first_name: params[:first_name], image: params[:image], github: params[:github])
        
        @student.save 

        erb :'students/profile'
    end

    get '/profile/edit' do #This edit route is not working
        @student = current_user

        erb :"students/edit"
    end



end