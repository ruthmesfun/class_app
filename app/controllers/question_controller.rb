class QuestionController < ApplicationController
    get '/questions/new' do
        if logged_in?
            @student = current_user
            erb :'questions/new'
        else 
            redirect '/login'
        end
    end

    get '/questions' do
        if logged_in?
            @questions = Question.all
            erb :"questions/index"
        else
            redirect '/login'
        end
    end

    get '/questions/:id' do 
        @question = Question.find(params[:id])
        if logged_in?
            erb :'questions/show'
        else
            redirect '/login'
        end
    end

    post '/questions' do
        @question = Question.create(title: params[:title], content: params[:content], link: params[:link], lab: params[:lab])
        
        if @question.valid? 
            @question.student  = current_user
            @question.save
            session[:question_id] = @question.id
            redirect "/questions/#{@question.id}"
        else
            redirect '/questions/new'
        end
    end
end