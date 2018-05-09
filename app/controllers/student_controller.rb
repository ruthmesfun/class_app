class StudentController < ApplicationController
    
    get '/login' do
        if logged_in?
            redirect '/questions'
        else
            erb :'students/login', :locals => {:client_id => CLIENT_ID}
        end
    end

    # post '/login' do
    #     @student = Student.find_by(username: params[:username])
    #     if @student
    #         session.clear
    #         session[:student_id] = @student.id 
    #         redirect "/questions"
    #     else 
    #         redirect '/login'
    #     end
    # end

    get '/signup' do
        if logged_in?
            redirect '/questions'
        else
            erb :'students/signup', :locals => {:client_id => CLIENT_ID}
        end
    end

    # post '/signup' do 
    #     @student = Student.create(first_name: params[:first_name], username: params[:username], password: params[:password], image: params[:image], github: params[:github])

    #     if @student.valid?
    #         session.clear
    #         session[:student_id] = @student.id
    #         redirect to "/questions"
    #     else
    #         redirect "/signup"
    #     end
    # end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end

    get "/profile" do #can't get it to customize url
        #  binding.pry
        # raise session.inspect
        if logged_in?
            
             @student = current_user
             erb :'students/profile'
        else
            redirect '/'
        end
        
    end

    patch '/profile' do
        @student = current_user
        @student.update(first_name: params[:first_name], image: params[:image], github: params[:github])

        @student.save 

        erb :'students/profile'
    end

    get '/profile/edit' do #This edit route is not working
        if logged_in?
            @student = current_user
            erb :"students/edit"
        else 
            redirect '/'
        end
    end

    get '/students/:id/delete' do
        @student = Student.find(params[:id])
        if logged_in? && current_user
            erb :'students/delete'
        else 
            redirect "/students/#{@student.id}"
        end
    end

    delete '/students/:id/delete' do
        @student = Student.find(params[:id])
        @student.delete
        
        redirect '/'

    end

end