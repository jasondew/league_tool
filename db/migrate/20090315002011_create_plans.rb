class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string :name
      t.integer :league_limit, :player_limit
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end
