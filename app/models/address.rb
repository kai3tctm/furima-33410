class Address < ApplicationRecord
  belongs_to :item
  belongs_to :buy
  belongs_to :delivery_area

  

end
