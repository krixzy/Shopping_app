class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :amount
      t.references :sublist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
