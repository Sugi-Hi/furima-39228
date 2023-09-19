FactoryBot.define do
   factory :item do
    image                   {"handbag.png"}
    item_name               {Faker::Commerce.product_name}
    price                   {"1000"}
    explain                 {"5年前程から使用しておりますが、保管箱にいれて汚れ無い様に使ってました。外観は紺青色、イラスト文字は黄色と、印象的にも落ち着いた感じの使いやすい布式手提げカバンになると思います。"}
    category_id             {"5"} 
    state_id                {"3"} 
    postfee_id              {"2"} 
    area_id                 {"25"} 
    shipdate_id             {"1"} 
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/手提げ布袋.png'), filename: 'handbag.png')
    end
  end

end

# 1	ランチセット	500	おにぎり弁当、野菜ジュース、カルピス飲料	10	2	2	25	1	2	
# 2	手提げ用の布袋	1000	5年前程から使用しておりますが、外観は紺青色、イラスト文字は黄色と、印象的にも落ち着いた感じの使いやすい布式手提げカバンになると思います。	4	4	2	25	1	2	