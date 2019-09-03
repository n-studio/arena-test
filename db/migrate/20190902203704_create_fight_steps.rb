class CreateFightSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :fight_steps do |t|
      t.references :fight, null: false, foreign_key: true
      t.string :hands, null: false
      t.string :damage_points, default: "0,0"

      t.timestamps
    end

    add_column :fights, :fight_steps_count, :integer, default: 0
  end
end
