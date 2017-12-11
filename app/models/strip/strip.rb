module Strip
  class Strip < ApplicationRecord
    
      
        
          has_one :neo_pixel, dependent: :destroy
          accepts_nested_attributes_for :neo_pixel
        
      
    
  end
end