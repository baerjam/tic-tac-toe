class AddUuidGameDetailsToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :uuid, :string
  end
end
