class CreateFights < ActiveRecord::Migration[6.0]
  def change
    create_table :fights, &:timestamps
  end
end
