class AddStateToFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :state, :string, default: "initiated"
  end
end
