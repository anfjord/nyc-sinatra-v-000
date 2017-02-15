class FiguresController < ApplicationController

  get '/figures' do
    @figure = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    erb :"/figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :"/figures/show"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks.create(params[:landmark])
    end

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params["id"])
    @landmark = @figure.landmarks
    @title = @figure.titles
      erb :"/figures/edit"
  end



  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    if !params[:figure][:name].empty?
      @figure.name = (params[:figure][:name])
    end
    if !params[:title][:name].empty?
      @figure.titles.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks.create(params[:landmark])
    end

    redirect to "/figures/#{@figure.id}"
  end

end
