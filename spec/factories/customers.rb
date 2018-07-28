FactoryBot.define do
    factory :customer do
      name Faker::Name.name    
      sequence(:email) { |n| "#{Faker::Name.name}.#{n}@gmail.com"}
     

  transient do 
    upcased false
    qtt_orders 3 #default value
  end
   
  trait :male do
    gender 'M'
  end

  trait :female do
    gender 'F'
  end

  trait :vip do
    vip true
  end

  trait :days_to_pay do
    days_to_pay 30
  end

  trait :with_orders do
    after(:create) do |customer, evaluator|
       create_list(:order, evaluator.qtt_orders, customer: customer)
    end
  end
    after(:create) do |customer, evaluator|
       customer.name.upcase! if evaluator.upcased
    end

  


  factory :customer_male_vip, traits: [:male, :vip]
  factory :customer_female_male_vip, traits: [:female, :male, :vip]
  factory :customer_female_vip, traits: [:female, :vip]


  end
end