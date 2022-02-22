class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.by_age
    @average_age = @movie.actors.average(:age)
  end

  def new
    @movie = Movie.find(params[:id])
  end

  def create
    movie = Movie.find(params[:id])

    redirect_to "/movies/#{movie.id}"
  end
end
