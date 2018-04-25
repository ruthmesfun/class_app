class AnswerController < ApplicationController
    get '/answers/new' do
        if logged_in?
            @student = current_user
            erb :'answers/new'
        else 
            redirect '/login'
        end
    end

    get '/answers' do
        if logged_in?
            @answers = Answer.all
            erb :"answers/index"
        else
            redirect '/login'
        end
    end

    get '/answers/:id' do 
        @answer = Answer.find(params[:id])
        if logged_in?
            erb :'answers/show'
        else
            redirect '/login'
        end
    end

    post '/answers' do
        @answer = Answer.create(title: params[:title], content: params[:content], link: params[:link], lab: params[:lab])

        if @answer.valid? 
            @answer.student  = current_user
            @answer.save
            session[:answer_id] = @answer.id
            redirect "/answers/#{@answer.id}"
        else
            redirect '/answers/new'
        end
    end

    get '/answers/:id/edit' do 
        @answer = Answer.find(params[:id])
        if logged_in? && @answer.student == current_user
            erb :'answers/edit'
        else
            redirect "/answers/#{@answer.id}"
        end
    end

    patch '/answers/:id' do 
        @answer = Answer.find(params[:id])

        @answer.update(title: params[:title], content: params[:content], link: params[:link], lab: params[:lab])

        @answer.save

        redirect "/answers/#{@answer.id}"
    end

    get '/answers/:id/delete' do
        @answer = Answer.find(params[:id])
        if logged_in? && @answer.student == current_user
            erb :'answers/delete'
        else 
            redirect "/answers/#{@answer.id}"
        end
    end

    delete '/answers/:id/delete' do
        @answer = Answer.find(params[:id])
        @answer.delete
        
        redirect '/answers'

    end
end