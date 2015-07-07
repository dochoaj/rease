class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :institution

  has_many :requests
  has_many :events
  has_many :meetings
  has_many :offerings
  has_and_belongs_to_many :messages
  has_many :comments
  has_many :sections


end
