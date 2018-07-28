require 'rails_helper'

RSpec.describe Order, type: :model do
    it 'Has one order - belongs_to' do 
     order = create(:order)
     puts order.description
     expect(order.customer).to be_kind_of(Customer) 
    end

    context 'test with more than one order' do
     it 'Has three orders' do 
      order_list = create_list(:order, 3)
      expect(order_list.count).to eq(3)
    end
     it 'Has many orders -your choice- has_many' do
      customer = create(:customer, :with_orders, qtt_orders: 4)
      expect(customer.orders.count).to eq(4)    
     end
  end
end
