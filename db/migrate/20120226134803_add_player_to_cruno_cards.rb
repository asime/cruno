class AddPlayerToCrunoCards < ActiveRecord::Migration
  def change
    add_column :cruno_cards, :player, :Player
  end
end
