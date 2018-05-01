FactoryGirl.define do
  
  factory :product do
    name Faker::Name.name
    price 2.0
    sale_tax 0.5
    import_tax 0.25
  end

  factory :order do
    order_number Faker::Number.number(10)
  end

  factory :order_item do
    item_name Faker::Name.name
    quantity 2
    cost 2.5
    sale_tax 1.0
    import_tax 0.25
  end
end