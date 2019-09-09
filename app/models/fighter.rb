class Fighter < ApplicationRecord
  has_many :fight_attendances
  has_many :fighters, through: :fight_attendances

  concerning :FightService do
    included do
      attr_accessor :remaining_life_points

      validate :points_limit
      validates :life_points, :attack_points, numericality: { greater_than: 0 }
      validates :name, :life_points, :attack_points, presence: true
    end

    def points_limit
      return if life_points + attack_points <= ::FightService::POINTS_LIMIT

      errors.add(:base, "points cannot exceed the limit of #{::FightService::POINTS_LIMIT}")
    end

    def init_stats
      @remaining_life_points = (life_points * ::FightService::LIFE_POINTS_FACTOR).round
    end
  end
end
