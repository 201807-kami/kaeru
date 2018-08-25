class Genre < ApplicationRecord
	has_many :items#, optional: true
	has_many :artists
end
