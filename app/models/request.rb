class Request < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :experience
  belongs_to :community
  belongs_to :area

  has_one :experience

  has_many :comments

#validaciones
	validates :title, presence: true, uniqueness: true #no pueden haber dos titulos iguales
	validates :description, presence: true, length: {minimum: 20, maximum: 10000} #validar maximos y minimos de caracteres
	validates :status, presence: true
	

end
