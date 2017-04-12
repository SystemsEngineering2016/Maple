class Map < ApplicationRecord
  belongs_to :mapfrom, :class_name => 'Table' , optional: true
  belongs_to :mapto, :class_name => 'Table' , optional: true
  # validates_presence_of :mapfrom_id, :message => "can't be blank "
  # validates_presence_of :mapto_id, :message => "can't be blank "
  # validates :mapfrom_id, :mapto_id, presence: true

  # validates_uniqueness_of :mapfrom_id, :scope => [:mapto_id], :message => "You have already created this mapping "
  validate :check_mapfrom
  validate :check_mapto
  validate :check_2versions
  validate :combination_mappings
  validate :combination_mappings2

  def check_mapfrom
    if !mapfrom_id.present?
      errors.add(:base, "no datapoint has been selected on the left")
    end
  end

  def check_mapto
    if !mapto_id.present?
      errors.add(:base, "no datapoint has been selected on the right")
    end
  end


  def check_2versions
    errors.add(:base, "not allowed to map between datapoints from the same version, please select different versions.") if fromVersionName == toVersionName
  end

  def combination_mappings
    if Map.exists?(:mapfrom_id => mapfrom_id,:mapto_id => mapto_id)
        errors.add(:base,"This mapping already exists.")
      end
  end

  def combination_mappings2
    if Map.exists?(:mapfrom_id => mapto_id,:mapto_id => mapfrom_id)
        errors.add(:base,"This mapping already exists.")
      end
  end
end
