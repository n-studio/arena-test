class AddRemainingLifeToFightSteps < ActiveRecord::Migration[6.0]
  def change
    add_column :fight_steps, :remaining_life_points, :string
  end
end
