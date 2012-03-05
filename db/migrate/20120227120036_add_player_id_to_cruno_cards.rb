class AddPlayerIdToCrunoCards < ActiveRecord::Migration
  def change
    add_column :cruno_cards, :player_id, :int
  end
end
