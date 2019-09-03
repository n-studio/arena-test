class CreateFightAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :fight_attendances do |t|
      t.belongs_to :fight
      t.belongs_to :fighter
      t.boolean :winner, default: false
      t.boolean :loser, default: false

      t.timestamps
    end
  end
end
