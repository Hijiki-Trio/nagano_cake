class Product < ApplicationRecord
  attachment :image
  
  belongs_to :genres
  
end
