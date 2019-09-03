class Fighter < ApplicationRecord
  POINTS_LIMIT = 10

  has_many :fight_attendances
  has_many :fighters, through: :fight_attendances
  attr_accessor :remaining_life_points

  validate :points_limit
  validates :life_points, :attack_points, numericality: { greater_than: 0 }
  validates :name, :life_points, :attack_points, presence: true

  def points_limit
    return if life_points + attack_points <= POINTS_LIMIT

    errors.add(:base, "points cannot exceed the limit of #{POINTS_LIMIT}")
  end

  def init_stats
    @remaining_life_points = life_points
  end
end
