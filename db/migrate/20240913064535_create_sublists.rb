class CreateSublists < ActiveRecord::Migration[7.2]
  def change
    create_table :sublists do |t|
      t.string :name
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
