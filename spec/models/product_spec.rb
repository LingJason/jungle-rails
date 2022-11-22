require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    # inital example
  it "Example with all 4 fields" do
  @category = Category.new
  @category.name = 'Flowers'
  @product = Product.new
  @product.name = 'Swamp ConeFlower'
  @product.price = 29.99
  @product.quantity = 21
  @product.category = @category
  expect(@product).to be_valid
  end

    it "validates name" do
      @category = Category.new(name:'Flowers')
      @product = Product.new(name: nil, price: 29.99, quantity:21, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
  
    it "validates price" do
      @category = Category.new(name:'Flowers')
      @product = Product.new(name: 'Swamp ConeFlower', price_cents: nil, quantity:21, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end
  
    it "validates quantity" do
      @category = Category.new(name:'Flowers')
      @product = Product.new(name: 'Swamp ConeFlower', price: 29.99, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
  
    it "validates category" do
      @category = Category.new(name:'Flowers')
      @product = Product.new(name: 'Swamp ConeFlower', price: 29.99, quantity: 21, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category must exist", "Category can't be blank")
    end
  end
end
