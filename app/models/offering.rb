class Offering < ActiveRecord::Base
  belongs_to :user
  belongs_to :experience
  belongs_to :community
  belongs_to :area
end
