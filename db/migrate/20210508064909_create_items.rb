class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,          null: false
      t.integer    :price,                 null: false
      t.text       :product_info,          null: false
      t.integer    :category_id,           null: false
      t.integer    :product_status_id,     null: false
      t.integer    :delivery_burden_id,    null: false
      t.integer    :delivery_area_id,      null: false
      t.integer    :estimated_delivery_id, null: false
      t.references :user,                  foreign_key: true
      t.timestamps
    end
  end
end
