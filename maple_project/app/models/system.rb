class System < ApplicationRecord
  has_many :versions, dependent: :destroy
  has_many :tables, through: :versions, dependent: :destroy
  validates_presence_of :System_Name, :message => "must be provided. Please try again. "
  validates_uniqueness_of :System_Name, :message => "already exists. Please choose a new name. (System names are not case sensitive).",:case_sensitive => false


end
