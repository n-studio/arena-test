class FightAttendance < ApplicationRecord
  belongs_to :fight
  belongs_to :fighter, optional: true
end
