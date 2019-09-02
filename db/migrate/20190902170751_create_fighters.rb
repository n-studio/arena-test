class CreateFighters < ActiveRecord::Migration[6.0]
  def change
    create_table :fighters do |t|
      t.string :name, null: false
      t.integer :life_points, default: 0
      t.integer :attack_points, default: 0
      t.integer :level, default: 0
      t.integer :exp_points, default: 0
      t.string :image
      t.timestamps
    end
  end
end
