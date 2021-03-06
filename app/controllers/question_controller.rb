require 'rack-flash'

class QuestionController < ApplicationController

    use Rack::Flash 

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
            @student = current_user
            erb :"questions/index"
        else
            redirect '/login'
        end
    end

    get '/questions/:id' do 
        @question = Question.find(params[:id])
        if logged_in?
            session[:question_id] = @question.id
            @current_user = current_user
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
            
            flash[:message] = "You successfully created a question!"

            session[:question_id] = @question.id
            redirect "/questions/#{@question.id}"
        else
            flash[:error] = "You need to add content!"
            redirect '/questions/new'
        end
    end

    get '/questions/:id/edit' do 
        @question = Question.find(params[:id])
        if logged_in? && @question.student == current_user
            erb :'questions/edit'
        else
            redirect "/questions/#{@question.id}"
        end
    end

    patch '/questions/:id' do 
        @question = Question.find(params[:id])

        @question.update(title: params[:title], content: params[:content], link: params[:link], lab: params[:lab])

        @question.save
        @current_user = current_user

        redirect "/questions/#{@question.id}"
    end

    get '/questions/:id/delete' do
        @question = Question.find(params[:id])
        if logged_in? && @question.student == current_user
            erb :'questions/delete'
        else 
            redirect "/questions/#{@question.id}"
        end
    end

    delete '/questions/:id/delete' do
        @question = Question.find(params[:id])
        @question.delete
        
        redirect '/questions'

    end
end