class Version < ApplicationRecord
  belongs_to :system
  validates_presence_of :Version_Name
  validates_uniqueness_of :Version_Name, :scope => :system_id, :message => "should happen once per year"
end
