require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'testing instances ' do
    it 'is valid with description, price and category' do
      product = create(:product)
      expect(product).to be_valid
    end
  end
  context 'Validations' do
    it { should validate_presence_of(:description)}
    it { is_expected.to validate_presence_of(:price)}
    it{ is_expected.to belong_to(:category)}
  end
  it 'is invalid if description be blank' do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end

  it 'expect that test return a product with full description' do
    product = create(:product)

    expect(product.full_description).to include("#{product.description}").and include("#{product.price}")
  end

end
