class Map < ApplicationRecord
  belongs_to :mapfrom, :class_name => 'Table'
  belongs_to :mapto, :class_name => 'Table'
  validates_presence_of :mapfrom_id, :message => "can't be blank "
  validates_presence_of :mapto_id, :message => "can't be blank "
  # validates :mapfrom_id, :mapto_id, presence: true

  validates_uniqueness_of :mapfrom_id, :scope => [:mapto_id], :message => "You have already created this mapping "
  
end
