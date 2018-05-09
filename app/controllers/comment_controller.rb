class CommentController < ApplicationController
    get '/comments/new' do
        if logged_in?
            @student = current_user
            @question = current_question
            erb :'comments/new'
        else 
            redirect '/login'
        end
    end

    get '/comments' do
        if logged_in?
            @comments = Comment.all
            erb :"comments/index"
        else
            redirect '/login'
        end
    end

    get '/comments/:id' do 
        @comment = Comment.find(params[:id])
        if logged_in?
            erb :'comments/show'
        else
            redirect '/login'
        end
    end

    post '/comments' do
        @comment = Comment.new
        @comment.content = params[:content]
        @comment.vote = 0

        if @comment.valid? 
            @comment.student  = current_user
            @comment.question = current_question
            @comment.save
            redirect "/questions/#{@comment.question.id}"
        else
            redirect '/comments/new'
        end
    end

    get '/comments/:id/edit' do 
        @comment = Comment.find(params[:id])
        if logged_in? && @comment.student == current_user
            erb :'comments/edit'
        else
            redirect "/questions/#{@comment.question.id}"
        end
    end

    patch '/comments/:id' do 
        @comment = Comment.find(params[:id])

        @comment.update(content: params[:content])

        @comment.save

        redirect "/questions/#{@comment.question.id}"
    end

    get '/comments/:id/delete' do
        @comment = Comment.find(params[:id])
        if logged_in? && @comment.student == current_user
            erb :'comments/delete'
        else 
            redirect "/questions/#{@comment.question.id}"
        end
    end

    delete '/comments/:id/delete' do
        @comment = Comment.find(params[:id])
        @comment.delete
        
        redirect "/questions/#{@comment.question.id}"

    end
end