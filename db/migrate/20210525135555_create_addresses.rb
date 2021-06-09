class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,      null: false
      t.integer    :delivery_area_id, null: false
      t.string     :municipality,     null: false
      t.string     :house_number,     null: false
      t.string     :building
      t.string     :phone,            null: false
      t.references :buy,              foreign_key: true
      t.timestamps
    end
  end
end
