class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :price, default: "0.00"
      t.string :qty, default: "1"
      t.belongs_to :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
