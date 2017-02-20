require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    let(:category) { Category.create!(name: 'Cactus') }
    let(:product) { category.products.new(name: 'Prickly Pear Plant', price: 3, quantity: 1) }


    it 'Should not allow empty price field' do
      product.price_cents = nil
      product.save
      expect(product).to_not be_persisted
      expect(product.errors.size).to eql(3)
      expect(product.errors.full_messages).to include('Price can\'t be blank')
    end

    it 'Should not allow category field to be empty' do
      product.category = nil
      product.save
      expect(product).to_not be_persisted
      expect(product.errors.size).to eql(1)
      expect(product.errors.full_messages).to include('Category can\'t be blank')
    end

    it 'Should not allow empty quantity field' do
      product.quantity = nil
      product.save
      expect(product).to_not be_persisted
      expect(product.errors.size).to eql(1)
      expect(product.errors.full_messages).to include('Quantity can\'t be blank')
end

      it 'Should not allow empty name' do
        product.name = nil
        product.save
        expect(product).to_not be_persisted
        expect(product.errors.size).to eql(1)
        expect(product.errors.full_messages).to include('Name can\'t be blank')
      end


  end

end
