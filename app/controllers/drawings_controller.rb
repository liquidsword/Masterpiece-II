class DrawingsController < ApplicationController

    get '/drawings' do
        if logged_in?
            @drawings = Drawing.all
            erb :'drawings/drawings'
        else
            redirect to '/login'
        end
    end

    get '/drawings/new' do
        if logged_in?
            erb :'drawings/create_drawing'
        else
            redirect to '/login'
        end
    end

    post '/drawings' do

        if params[:file][:filename].blank?
            redirect to '/drawings/new'
        else
            artist = Artist.find_by(:id => session[:artist_id])
            @drawing = Drawing.create(:title => params[:file][:filename], :artist_id => session[:artist_id], :file => params[:file][:filename])
            redirect to "/drawings/#{@drawing.id}"
        end
    end


    get '/drawings/:id' do

        if logged_in?
            @drawing = Drawing.find_by(:id => params[:id])
            erb :'/drawings/show_drawing'
        else
            redirect to '/login'
        end
    end


    get '/drawings/:id/edit' do
        if logged_in?
            @drawing = Drawing.find_by(:id => params[:id])
            erb :'/drawings/edit_drawing'
        else
            redirect to '/login'
        end
    end

    patch '/drawings/:id' do
        if params[:title] == "" && @drawing.artist_id == session[:artist_id]
            redirect to "/drawings/#{params[:id]}/edit"
        else
            @drawing = Drawing.find_by(params[:id])
            @drawing.title = params[:title]
            @drawing.save
            redirect to "/drawings/#{@drawing.id}"
        end
    end

    delete '/drawing/:id' do
        @drawing_object = Drawing.delete(params[:id])
        redirect to("/drawings")
    end
end
