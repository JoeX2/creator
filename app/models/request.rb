class Request < ActiveRecord::Base
  has_and_belongs_to_many :profiles
  has_many :queries
  has_one :response
end
