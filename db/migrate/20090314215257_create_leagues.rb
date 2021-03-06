class CreateLeagues < ActiveRecord::Migration
  def self.up
    create_table :leagues do |t|
      t.belongs_to :user

      t.string :name, :sponsor

      t.datetime :registration_closed_at

      t.timestamps

      t.integer :players_count, :default => 0
    end
  end

  def self.down
    drop_table :leagues
  end
end
