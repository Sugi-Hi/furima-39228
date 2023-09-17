class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :item_name    , null: false
      t.integer     :price        , null: false
      t.text        :explain      , null: false
      t.integer     :category_id  , null: false
      t.integer     :state_id     , null: false
      t.integer     :postfee_id   , null: false
      t.integer     :area_id      , null: false
      t.integer     :shipdate_id  , null: false
      t.integer     :user         , null: false
      # t.references  :user         , null: false, foreign_key: true

      t.timestamps
    end
  end
end
