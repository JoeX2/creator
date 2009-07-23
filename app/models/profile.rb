class Profile < ActiveRecord::Base
  has_and_belongs_to_many :requests
  has_and_belongs_to_many :responses
  has_many :queries
end
