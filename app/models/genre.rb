class Genre < ApplicationRecord
 has_many :works
 validates :name, presence: true
end
