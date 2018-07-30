class DrawingsController < ApplicationController

  # GET: /drawings
  get "/drawings" do
    erb :"/drawings/index.html"
  end

  # GET: /drawings/new
  get "/drawings/new" do
    erb :"/drawings/new.html"
  end

  # POST: /drawings
  post "/drawings" do
    redirect "/drawings"
  end

  # GET: /drawings/5
  get "/drawings/:id" do
    erb :"/drawings/show.html"
  end

  # GET: /drawings/5/edit
  get "/drawings/:id/edit" do
    erb :"/drawings/edit.html"
  end

  # PATCH: /drawings/5
  patch "/drawings/:id" do
    redirect "/drawings/:id"
  end

  # DELETE: /drawings/5/delete
  delete "/drawings/:id/delete" do
    redirect "/drawings"
  end
end
