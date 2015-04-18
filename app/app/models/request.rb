class Request < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :experience
  belongs_to :community
  belongs_to :area

  has_one :experience

  has_many :comments

end
