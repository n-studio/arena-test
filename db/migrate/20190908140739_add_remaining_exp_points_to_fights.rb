class AddRemainingExpPointsToFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :exp_points, :integer, default: 0
  end
end
