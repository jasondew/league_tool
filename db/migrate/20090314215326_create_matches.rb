class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.belongs_to :league
      t.belongs_to :home_player
      t.belongs_to :away_player

      t.string :state

      t.datetime :scheduled_at

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
