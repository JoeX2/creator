class Query < ActiveRecord::Base
  belongs_to :request
  belongs_to :profile
end
