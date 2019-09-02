class Fighter < ApplicationRecord
  POINTS_LIMIT = 10

  validate :points_limit
  validates :life_points, :attack_points, numericality: { greater_than: 0 }
  validates :name, :life_points, :attack_points, presence: true

  def points_limit
    return if life_points + attack_points <= POINTS_LIMIT

    errors.add(:base, "points cannot exceed the limit of #{POINTS_LIMIT}")
  end
end
