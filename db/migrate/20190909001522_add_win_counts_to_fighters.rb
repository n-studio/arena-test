class AddWinCountsToFighters < ActiveRecord::Migration[6.0]
  def change
    add_column :fighters, :wins_count, :integer, default: 0
    add_column :fighters, :losses_count, :integer, default: 0
  end
end
