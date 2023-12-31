class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string      :post_number ,null: false
      t.integer     :area_id     ,null: false
      t.string      :city        ,null: false
      t.string      :tawn        ,null: false
      t.string      :build       
      t.string      :tel_number  ,null: false
      t.references  :order       ,null: false ,foreign_key: true
      t.timestamps
    end
  end
end
