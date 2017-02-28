class System < ApplicationRecord
  has_many :versions
  validates :System_Name, presence: true,
                  length: { minimum: 1 }
end
