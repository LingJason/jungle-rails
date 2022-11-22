require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    # inital example
  it "Example of user that passes" do
  @user = User.new
  @user.name = 'Jason'
  @user.email = 'JasonLing1@gmail.com'
  @user.password = '123123'
  @user.password_confirmation ='123123'
  @user.save
  expect(@user).to be_valid
  end

    it "validates name input" do
      @user = User.new(name: nil, email: 'JasonLing@gmail.com', password:'123123', password_confirmation:'123123')
      @user.save
      expect(@user).not_to be_valid
    end
  
    it "validates email input" do
      @user = User.new(name:'Jason', email: nil, password:'123123', password_confirmation:'123123')
      @user.save
      expect(@user).not_to be_valid
    end
  
    it "validates password input" do
      @user = User.new(name:'Jason', email: 'JasonLing@gmail.com', password: nil, password_confirmation:nil)
      @user.save
      expect(@user).not_to be_valid
    end

    it "validates password do not match" do
      @user = User.new(name:'Jason', email: 'JasonLing@gmail.com', password:'122123', password_confirmation:'123112')
      @user.save
      expect(@user).not_to be_valid
    end

    it "Email must be unique" do
      @user = User.new(name: 'Jason', email: 'JasonLing@gmail.com', password:'12311', password_confirmation:'12311')
      @user.save
      @user1 = User.new(name: 'Tony', email: 'JasonLing@gmail.com', password:'123123', password_confirmation:'123123')
      @user1.save
      expect(@user1).not_to be_valid
    end

    it "Password must have a min length of 5" do
      @user = User.new(name: 'Jason', email: 'JasonLing@gmail.com', password:'123', password_confirmation:'123')
      @user.save
      expect(@user).not_to be_valid
    end
  end


  describe '.authenticate_with_credentials' do
    
    it "Email has spaces before and after it" do
      @user = User.new(name: 'Jason', email: 'JasonLing@gmail.com', password:'123123', password_confirmation:'123123')
      @user.save
      login = User.authenticate_with_credentials(' JasonLing@gmail.com ','123123')
      expect(login).to be_valid
    end

    it "Email has is not case sensitive" do
      @user = User.new(name: 'Jason', email: 'JasonLing@gmail.com', password:'123123', password_confirmation:'123123')
      @user.save
      login = User.authenticate_with_credentials('JASONLING@gmail.com','123123')
      expect(login).to be_valid
    end

  end

end
