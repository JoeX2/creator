class RequestToResponse < ActiveRecord::Migration
  def self.up
    add_column :responses, :request, :integer
  end

  def self.down
    remove_column :responses, :request
  end
end
