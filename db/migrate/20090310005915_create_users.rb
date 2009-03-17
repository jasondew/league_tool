class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.belongs_to :plan

      t.string :email, :limit => 100
      t.string :first_name, :last_name, :limit => 100
      t.string :crypted_password, :salt, :limit => 40

      t.string :state, :null => :no, :default => 'passive'

      t.string :remember_token, :activation_code, :limit => 40
      t.datetime :remember_token_expires_at, :activated_at, :created_at, :updated_at, :deleted_at

      t.integer :leagues_count, :default => 0
    end

    add_index :users, :email, :unique => true
  end

  def self.down
    drop_table :users
  end
end
