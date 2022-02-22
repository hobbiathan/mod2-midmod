require 'rails_helper'

RSpec.describe 'Studio Index' do
  before(:each) do
    @studio = Studio.create!(name: "Universal Pictures", location: "California")
    @studio_two = Studio.create!(name: "Paramount Global", location: "New York")

    @movie = @studio.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Science Fiction")
    @movie_two = @studio.movies.create!(title: "Saving Private Ryan", creation_year: 1998, genre: "Drama")
    @movie_three = @studio.movies.create!(title: "The Sum of All Fears", creation_year: 2002, genre: "Drama")


  end

  it 'Displays all studio names and locations' do
    expect(page).to have_content(@studio.name)
    expect(page).to have_content(@studio.location)

    expect(page).to have_content(@studio_two.name)
    expect(page).to have_content(@studio_two.location)
  end

  it 'Displays titles of all movies belonging to respective studio' do
    expect(page).to have_content(@movie.name)
    expect(page).to have_content(@movie_two.name)
    expect(page).to have_content(@movie_three.name)
  end
end
