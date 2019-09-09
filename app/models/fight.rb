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
      @winner ||= fighter_by_status(:winner)
    end

    def loser
      @loser ||= fighter_by_status(:loser)
    end

    def fighter_by_status(status)
      if fight_attendances.loaded?
        fight_attendances.to_a.select(&status.to_sym).first&.fighter
      else
        fight_attendances.find_by(status => true)&.fighter
      end
    end

    private

    def set_exp_points
      self.exp_points = 100
    end
  end
end
