class Response < ActiveRecord::Base
  has_and_belongs_to_many :profiles
  belongs_to :request
end
