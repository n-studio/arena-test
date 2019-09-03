class FightStep < ApplicationRecord
  belongs_to :fight, counter_cache: true
end
