class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.belongs_to :league
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end
