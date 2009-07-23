class RequestToResponse < ActiveRecord::Migration
  def self.up
    add_column :responses, :request_id, :integer
  end

  def self.down
    remove_column :responses, :request_id
  end
end
