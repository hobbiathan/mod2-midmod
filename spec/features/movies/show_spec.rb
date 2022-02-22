require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  before(:each) do
    @studio = Studio.create!(name: "Universal Pictures", location: "California")
    @studio_two = Studio.create!(name: "Paramount Global", location: "New York")

    @movie = @studio.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Science Fiction")
    @movie_two = @studio.movies.create!(title: "Saving Private Ryan", creation_year: 1998, genre: "Drama")
    @movie_three = @studio_two.movies.create!(title: "The Sum of All Fears", creation_year: 2002, genre: "Drama")

    @actor = @movie.actors.create!(name: "Laura Dern", age: 55)
    @actor_two = @movie.actors.create!(name: "Nam Neill", age: 74)
    @actor_three = @movie_two.actors.create!(name: "Tom Hanks", age: 65)
    @actor_four = @movie_three.actors.create!(name: "Morgan Freeman", age: 84)
  end

  it 'should show movie title, year, and genre' do
    visit "/movies/#{@movie.id}"
    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.creation_year)
    expect(page).to have_content(@movie.genre)

    expect(page).to_not have_content(@movie_two.title)
    expect(page).to_not have_content(@movie_two.creation_year)
    expect(page).to_not have_content(@movie_two.genre)

    expect(page).to_not have_content(@movie_three.title)
    expect(page).to_not have_content(@movie_three.creation_year)
    expect(page).to_not have_content(@movie_three.genre)
  end

  it 'should show average actor age' do
    visit "/movies/#{@movie.id}"
    expect(page).to have_content(64.5)
  end

  it 'should link to add actor' do
    visit "/movies/#{@movie.id}"
    click_button("Add Actor")
    expect(current_path).to eq("/movies/#{@movie.id}/new")
  end
end
