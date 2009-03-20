class CreateAvailabilities < ActiveRecord::Migration
  def self.up
    create_table :availabilities do |t|
      t.belongs_to :user
      t.string :day
      t.time :starts_at, :ends_at
      t.timestamps
    end
  end

  def self.down
    drop_table :availabilities
  end
end
