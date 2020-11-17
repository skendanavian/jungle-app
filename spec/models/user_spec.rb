require 'rails_helper'


RSpec.describe User, type: :model do
  describe "Validations" do

    describe "name validation" do
      it "requires first name field" do
        @user = User.create(first_name: nil, last_name: "Smith", email: "jimsmith@example.com", password: nil, password_confirmation: "password")
        expect(@user.errors.full_messages).to include("First name can't be blank") 
      end
      it "requires last name field" do
        @user = User.create(first_name: "Jim", last_name: nil, email: "jimsmith@example.com", password: nil, password_confirmation: "password")
        expect(@user.errors.full_messages).to include("Last name can't be blank") 
      end
      
    end
  
    describe "password validation" do

    it "requires password field" do
      @user = User.create(first_name: "Jim", last_name: "Smith", email: "jimsmith@example.com", password: nil, password_confirmation: "password")
      expect(@user.errors.full_messages).to include("Password can't be blank") 
    end
    it "requires password_confirmation field" do
      @user = User.create(first_name: "Jim", last_name: "Smith", email: "jimsmith@example.com", password: "password", password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank") 
    end
    it "throws error when passwords do not match" do
      @user = User.create(first_name: "Jim", last_name: "Smith", email: "jimsmith@example.com", password: "wrongpassword", password_confirmation: "password")
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
    end
    it "saves successfully when passwords match" do
      @user = User.create(first_name: "Jim", last_name: "Smith", email: "jimsmith@example.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to eq([]) 
    end
    it "requires password to be at least 7 chars long" do
      @user = User.create(first_name: "Jim", last_name: "Smith", email: "jimsmith@example.com", password: "pass", password_confirmation: "pass")
      expect(@user.errors.full_messages).to eq(["Password is too short (minimum is 7 characters)"]) 
    end
    it "saves successfully when password is between 7 and 40 chars" do
      @user = User.create(first_name: "Jim", last_name: "Smith", email: "jimsmith@example.com", password: "passssssssssssssssssssssssssssssssssssss", password_confirmation: "passssssssssssssssssssssssssssssssssssss")
      expect(@user.errors.full_messages).to eq([]) 
    end
    end

    describe "email validation" do
      it "requires email field to be filled" do
        @user = User.create(first_name: "Jim", last_name: "Smith", email: nil, password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include("Email can't be blank") 
      end
      it "will not save if an identical email is already in the database" do
        @user = User.create(first_name: "Jim", last_name: "Smith", email: "jimsmith@example.com", password: "password", password_confirmation: "password")
        @user1 = User.create(first_name: "Mike", last_name: "Jones", email: "jimsmith@example.com", password: "password", password_confirmation: "password")
      expect(@user1.errors.full_messages).to include("Email has already been taken") 
      end
      it "will ignore case when comparing if an email is already in the database" do
        @user = User.create(first_name: "Jim", last_name: "Smith", email: "JimSmiTh@examPle.com", password: "password", password_confirmation: "password")
        @user1 = User.create(first_name: "Mike", last_name: "Jones", email: "jimsmith@example.com", password: "password", password_confirmation: "password")
      expect(@user1.errors.full_messages).to include("Email has already been taken") 
      end
    end
  end

  describe '.authenticate_with_credentials' do
    
    it "returns the user when user exists and password matches" do
      @user = User.new(first_name: "Jim", last_name: "Smith", email: "smith@example.com", password: "password", password_confirmation: "password")
      @user.save
      @auth_user = User.authenticate_with_credentials("smith@example.com", "password")
      expect(@auth_user).to eql(@user)
      puts @auth_user.inspect

    end
    it "removes whitespace in email authentication" do
      @user = User.new(first_name: "Jim", last_name: "Smith", email: "newemail@example.com", password: "password", password_confirmation: "password")
      @user.save
      @auth_user = User.authenticate_with_credentials("  newemail@example.com  ", "password")
      expect(@auth_user).to eql(@user)
      puts @auth_user.inspect

    end
    it "removes case sensitivity for email authentication" do
      @user = User.new(first_name: "Jim", last_name: "Smith", email: "eMail@exAmple.Com", password: "password", password_confirmation: "password")
      @user.save
      @auth_user = User.authenticate_with_credentials("email@example.com", "password")
      expect(@auth_user).to eql(@user)
      puts @auth_user.inspect

    end
  end

end

# Must be created with password and password_confirmation fields - match/non-match tests - required
# Emails must be unique and not be case sensitive
#Email, first name and last name should all be required

#Password must have a minimum length when a user account is being created

# create_table "users", force: :cascade do |t|
#   t.string   "first_name"
#   t.string   "last_name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end
