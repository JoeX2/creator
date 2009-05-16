class ProfileRequest < ActiveRecord::Migration
  def self.up
    create_table :profiles_requests, :id => false do |t|
      t.integer :profile_id
      t.integer :request_id
    end 
  end

  def self.down
    drop_table :profiles_requests
  end
end
