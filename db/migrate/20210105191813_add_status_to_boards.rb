class AddStatusToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :status, :string
  end
end
