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
        else
            redirect '/login'
        end
    end

    post '/questions' do
        @question = Question.create(params)
        @question.student_id = current_user.id
        @question.save
        @questions = Question.all

        erb :"questions/index"
    end
end