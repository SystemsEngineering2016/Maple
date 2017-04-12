class Map < ApplicationRecord
  belongs_to :mapfrom, :class_name => 'Table' , optional: true
  belongs_to :mapto, :class_name => 'Table' , optional: true
  validates_presence_of :mapfrom_id, :message => "can't be blank "
  validates_presence_of :mapto_id, :message => "can't be blank "
  # validates :mapfrom_id, :mapto_id, presence: true

  validates_uniqueness_of :mapfrom_id, :scope => [:mapto_id], :message => "You have already created this mapping "
  validate :check_2versions
  validate :combination_mappings
  def combination_mappings
  if Map.exists?(:mapfrom_id => mapto_id,:mapto_id => mapfrom_id)
      errors.add(:base,"This mapping has already been made but in the opposite direction. To view, swap the systems and versions below.")
  end
end

  def check_2versions
    errors.add(:Not_Allowed, "to map between datapoints from the same version.") if fromVersionName == toVersionName
  end

end
