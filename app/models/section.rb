class Section < ActiveRecord::Base
	belongs_to :user

	#validaciones
	validates :title, presence: true, uniqueness: true #no pueden haber dos titulos iguales
	validates :body, presence: true, length: {minimum: 20, maximum: 10000} #validar maximos y minimos de caracteres
	validates :order, presence: true #no puede haber carácteres en blanco
	validates :priority, presence: true #no puede haber carácteres en blanco
end