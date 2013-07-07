class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.datetime :time, :null => false
      t.integer :movie_id, :null => false
      
      t.timestamps
    end
  end
end
