# It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required


require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid when creating a new user' do
      @user = User.new(name: "fake name", email: "fake@email.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end
    it 'is not valid when there is no name' do
      @user = User.new(name: nil)
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'is not valid when there is no email' do
      @user = User.new(email: nil)
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'should not be valid if password and password_confirmation are different' do
      @user = User.new(password: "1234", password_confirmation: "2134")
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'should not pass if email is not unique' do
      @user = User.new(email: "test@test.com")
      @user.save
      @user2 = User.new(email: "test@test.com")
      @user2.save
      expect(@user2.id).not_to be_present
    end
    it 'should not pass if password is less than 8 characters' do
      @user = User.new(password: "1234567")
      expect(@user).to be_invalid
    end
  end
  describe '.authenticate_with_credentials' do
    it "should pass if a visitor types spaces within the email field" do
      user = User.new(name: "fake name", email: "test@test.com", password: "123456789", password_confirmation: "123456789")  
      user.save
      user = User.authenticate_with_credentials("   test@test.com ", "123456789")
      expect(user).not_to be(nil)
    end
    it "should pass even if the caps are not the same" do
      user = User.new(name: "fake name", email: "test@test.com", password: "123456789", password_confirmation: "123456789")  
      user.save
      user = User.authenticate_with_credentials("teSt@tEsT.com", "123456789")
      expect(user).not_to be(nil)
    end
  end
end