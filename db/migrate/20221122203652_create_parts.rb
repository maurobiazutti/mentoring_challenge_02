class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.integer :value
      t.references :provider, null: false, foreign_key: true


      t.timestamps
    end
  end
end
