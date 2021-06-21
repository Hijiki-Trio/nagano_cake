class Product < ApplicationRecord
  attachment :image
  
  belongs_to :genre
  
  def tax_included
  	(price*1.10).round
  end
  
end
