class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet
  validates :name, presence: true
  validates :name, :scientist, :planet, uniqueness: true
end
