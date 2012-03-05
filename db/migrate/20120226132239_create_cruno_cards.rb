class CreateCrunoCards < ActiveRecord::Migration
  def change
    create_table :cruno_cards do |t|
      t.string :value
      t.string :color

      t.timestamps
    end
  end
end
