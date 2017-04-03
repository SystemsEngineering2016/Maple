class Map < ApplicationRecord
  belongs_to :mapfrom, :class_name => 'Table'
  belongs_to :mapto, :class_name => 'Table'
end
