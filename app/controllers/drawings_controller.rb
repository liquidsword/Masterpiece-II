class DrawingsController < ApplicationController

    get '/drawings' do
        if session[:artist_id]
            @drawings = Drawing.all
            erb :'drawings/drawings'
        else
            redirect to '/login'
        end
    end

    get '/drawings/new' do
        if session[:artist_id]
            erb :'drawings/create_drawing'
        else
            redirect to '/login'
        end
    end

    post '/drawings' do

        if params[:art]== ""
            redirect to '/drawings/new'
        else
            artist = Artist.find_by_id(session[:artist_id])
            @drawing = Drawing.create(:art => params[:art], :artist_id => artist.id) #may need to change code because art attribute is a string
            redirect to "/drawings/#{@drawing.id}"
        end
    end

    get '/drawings/:id' do

        if session[:artist_id]
            @drawing = Drawing.find_by_id(params[:id])
            erb :'/drawings/show_drawing'
        else
            redirect to '/login'
        end
    end


    get '/drawings/:id/edit' do
        if session[:artist_id]
            @drawing = Drawing.find_by_id(params[:id])
            if @drawing.artist_id == session[:artist_id]
                erb :'/drawings/edit_drawing'
            else
                redirect to '/drawings'
            end
        else
            redirect to '/login'
        end
    end

    post '/save_image' do #is this code necessary???, may have to delete this and use post '/drawings'
                          #will have to change the code in drawings.erb and create_drawing.erb and show_drawing.erb

      @filename = params[:file][:filename]
      file = params[:file][:tempfile]

      erb :'drawings/show_drawing'
    end

    patch '/drawings/:id' do
        if params[:art] == "" && @drawing.artist_id == session[:artist_id]
            redirect to "/drawings/#{params[:id]}/edit"
        else
            @drawing = Drawing.find_by_id(params[:id])
            @drawing.art = params[:art]
            @drawing.save
            redirect to "/drawings/#{@drawing.id}"
        end
    end

    delete '/drawings/:id/delete' do
        @drawing = Drawing.find_by_id(params[:id])
        if session[:artist_id]
            @drawing = Drawing.find_by_id(params[:id])
            if @drawing.artist_id == session[:artist_id]
                @drawing.delete
            end
                redirect to '/drawings'

        else
            redirect to '/login'
        end
    end
end
