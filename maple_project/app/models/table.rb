class Table < ApplicationRecord
  belongs_to :version
  validates_presence_of :Longest_Name, :message => "must be provided. Please try again. "
end
