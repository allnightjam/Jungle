require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid when all fields have a value' do
      @category = Category.new(name: "exampleCategory")
      @product = Product.new(name: "fake", price_cents: 2000, quantity: 2, category: @category)
      expect(@product).to be_valid
    end
    it 'is not valid without a name' do
      @category = Category.new(name: "exampleCategory")
      @product = Product.new(name: nil, price_cents: 2000, quantity: 2, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'is not valid without a price' do
      @category = Category.new(name: "exampleCategory")
      @product = Product.new(name: "fake", price_cents: nil, quantity: 2, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'is not valid without a quantity' do
      @category = Category.new(name: "exampleCategory")
      @product = Product.new(name: "fake", price_cents: 2000, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'is not valid without a category' do
      @category = Category.new(name: "exampleCategory")
      @product = Product.new(name: "fake", price_cents: 2000, quantity: 2, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end