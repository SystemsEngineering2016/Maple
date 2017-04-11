class Map < ApplicationRecord
  belongs_to :mapfrom, :class_name => 'Table'
  belongs_to :mapto, :class_name => 'Table'
  validates_presence_of :mapfrom_id, :message => "must be provided "
  validates_presence_of :mapto_id, :message => "must be provided "


  validates_uniqueness_of :mapfrom_id, :scope => [:mapto_id], :message => "You have already created this mapping "
  validates_uniqueness_of :mapto_id, :scope => [:mapfrom_id], :message => "You have already created this mapping "
end
