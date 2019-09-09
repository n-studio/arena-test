class Fight < ApplicationRecord
  has_many :fight_attendances, dependent: :destroy
  has_many :fighters, through: :fight_attendances
  has_many :fight_steps, dependent: :destroy

  scope :finished, -> { where(state: "finished") }

  concerning :FightService do
    included do
      before_create :set_exp_points
    end

    def add_fighter(fighter)
      return if fighters.count >= ::FightService::FIGHTERS_COUNT_MAX || fighters.include?(fighter)

      fighters << fighter
    end

    def winner
      @winner ||= fight_attendances.find_by(winner: true)&.fighter
    end

    def loser
      @loser ||= fight_attendances.find_by(loser: true)&.fighter
    end

    private

    def set_exp_points
      self.exp_points = 100
    end
  end
end
