require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  before(:each) do
    @studio = Studio.create!(name: "Universal Pictures", location: "California")
    @studio_two = Studio.create!(name: "Paramount Global", location: "New York")

    @movie = @studio.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Science Fiction")
    @movie_two = @studio.movies.create!(title: "Saving Private Ryan", creation_year: 1998, genre: "Drama")
    @movie_three = @studio_two.movies.create!(title: "The Sum of All Fears", creation_year: 2002, genre: "Drama")
  end

  # it 'should show movie title, year, and genre' do
  #   visit "/movies/1"
  #   expect(page).to have_content(@movie.title)
  #   expect(page).to have_content(@movie.creation_year)
  #   expect(page).to have_content(@movie.genre)
  #
  #   expect(page).to_not have_content(@movie_two.title)
  #   expect(page).to_not have_content(@movie_two.creation_year)
  #   expect(page).to_not have_content(@movie_two.genre)
  #
  #   expect(page).to_not have_content(@movie_not.title)
  #   expect(page).to_not have_content(@movie_not.creation_year)
  #   expect(page).to_not have_content(@movie_not.genre)
  # end
  #
  # it 'should list all actors from youngest to oldest' do
  #
  # end
  #
  # it 'should show average actor age' do
  #
  # end
end
