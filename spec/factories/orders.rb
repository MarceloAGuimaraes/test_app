FactoryBot.define do
  factory :order do
    sequence(:description) {|n| "Order number - #{n}" }
    association :customer , factory: :customer
  end
end
