class System < ApplicationRecord
  validates :System_Name, presence: true,
                  length: { minimum: 1 }
end
