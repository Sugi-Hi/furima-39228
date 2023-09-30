FactoryBot.define do
  factory :order_delivery do
      price          {17000}
      token          {"tok_abcdefghijk00000000000000000"}
      post_number    {"597-7951"}
      area_id        {"26"}
      city           {"宇治市"}
      tawn           {"六地蔵2-1"}
      build          {"古都ビル"}
      tel_number     {"0774257100"}

       
       # ※Formオブジェクトクラスの場合は使用不可!
      # association :user 
      # association :item   
  end



end
