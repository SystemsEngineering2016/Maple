class Table < ApplicationRecord
  belongs_to :version
  validates_presence_of :Longest_Name, :message => "must be provided. Please try again. "
  validates_uniqueness_of :Longest_Name, :scope => :version_id, :message => "already exists. Please choose a new logical name for data point. (Logical names are not case sensitive).",:case_sensitive => false
  validates :Display_Width, numericality: { only_integer: true,:allow_blank => true, :message => "must be an integer. Please try again." }
  validates :Display_Height, numericality: { only_integer: true, :allow_blank => true, :message => "must be an integer. Please try again." }
end
