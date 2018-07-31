require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'create a customer' do
   customer = create(:customer, name: "jackson")
   expect(customer.full_name).to match(/jackson/)
  
  end

  it 'create a customer on factories' do
     cc = create(:customer, :vip)
     expect(cc.full_name).to start_with("Sr")
     expect(cc.vip).to be_truthy
     puts cc.email
  end

  it {expect { create(:customer)}.to change(Customer, :count).by(1) }
  
  it 'hello world' do
    atributes = attributes_for(:customer)
    name = "Diference"
    expect(atributes: name).not_to eq(name)
  end

  it 'atributo transitório' do
     customer = create(:customer, upcased: true)

     aux = customer.name.upcase

     expect(aux).to eq(customer.name)
  end

  it 'testing the traits tests' do
     customer = create(:customer_male_vip)
     expect(customer.gender).not_to eq('F')

     attrr = attributes_for(:customer, :female)
     customer.gender = attrr[:gender]
     puts customer.gender
  end

  it 'travel_to' do 
   travel_to Time.zone.local(2004, 11, 24, 01, 04 ,44) do
     @customer = create(:customer)
   end
   
   expect(@customer.created_at).to eq(Time.new(2004, 11, 24, 01, 04 ,44,0))
  end

end
