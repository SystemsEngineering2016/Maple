class System < ApplicationRecord
  has_many :versions, dependent: :destroy
  validates :System_Name, presence: true,
                  length: { minimum: 1 }
end
