class System < ApplicationRecord
  has_many :versions, dependent: :destroy
  validates_presence_of :System_Name
  validates_uniqueness_of :System_Name, :message => "System name has already been taken. System names are not case sensitive.",:case_sensitive => false
end
