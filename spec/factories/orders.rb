FactoryBot.define do
  factory :order do
    id             {2}
    price          {3000}
    token          {"tok_abcdefghijk00000000000000000"}
    post_number    {"620-0886"}
    area_id        {"26"}
    city           {"福知山市"}
    tawn           {"堀"}
    build          {"福知山大学"}
    tel_number     {"0773247100"}

    association :user 
    association :item 

  end
end
