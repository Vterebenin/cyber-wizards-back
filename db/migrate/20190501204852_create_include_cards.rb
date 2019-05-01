class CreateIncludeCards < ActiveRecord::Migration[5.2]
  def change
    create_table :include_cards do |t|
      t.references :card, foreign_key: true
      t.references :deck, foreign_key: true

      t.timestamps
    end
  end
end
