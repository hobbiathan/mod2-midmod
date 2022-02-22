class CreateMovieActors < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_actors do |t|
      t.references :movies, foreign_key: true
      t.references :actors, foreign_key: true
    end
  end
end
