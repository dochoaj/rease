class Experience < ActiveRecord::Base
	belongs_to :user
	belongs_to :request
	belongs_to :offering
	belongs_to :institution

	validates :description, :length => {
    :minimum   => 1,
    :maximum   => 100,
    :tokenizer => lambda { |str| str.split },
    :too_short => "Debe tener por lo menos %{count} palabra",
    :too_long  => "Debe tener máximo %{count} palabras"
  }
end