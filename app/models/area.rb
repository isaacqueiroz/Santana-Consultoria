class Area < ActiveRecord::Base
    
   validates_length_of :name,
    :in => 6..20,
    :too_short => "deve ter ao menos {{count}} letras.",
    :too_long => "deve ter no máximo {{count}} letras."

    
   validates_length_of :description,
    :in => 6..400,
    :too_short => "deve ter ao menos {{count}} letras.",
    :too_long => "deve ter no máximo {{count}} letras."
  
end
