class Category < ApplicationRecord
  

  has_many :productions
  has_ancestry

end
