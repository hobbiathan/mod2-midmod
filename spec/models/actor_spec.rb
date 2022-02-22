require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'class methods' do
    it '::by_age' do
      @actor = Actor.create!(name: "Nam Neill", age: 74)
      @actor_two = Actor.create!(name: "Laura Dern", age: 55)
      expect(Actor.by_age).to eq([@actor_two, @actor])
    end
  end
end
