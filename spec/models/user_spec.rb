require 'rails_helper'

RSpec.describe User, type: :model do

    describe 'Validations' do
  
      it 'should have same password and password_confirmation' do
        @user = User.new({
        name: "Roman", 
        mobile: "6474469950",
        email: "roman.medvedev@gmail.com", 
        user_type_id: "12",
        password: "123456", 
        password_confirmation: "123456"})
        expect(@user.password).to eql(@user.password_confirmation), @user.errors.full_messages
      end
      it 'should NOT valid of  password and password_confirmation is NOT the same' do
        @user = User.new({
        name: "Roman", 
        mobile: "6474469950",
        email: "roman.medvedev@gmail.com", 
        user_type_id: "12",
        password: "123456", 
        password_confirmation: "12345"})
        expect(@user.password).not_to eql(@user.password_confirmation), @user.errors.full_messages
      end
      it 'should not valid without any argument' do
        @user = User.new({
        name: nil, 
        mobile: nil,
        email: nil, 
        user_type_id: nil,
        password: nil, 
        password_confirmation: nil})
        expect(@user).not_to be_valid
      end
      it 'should have unique email' do
        @user1 = User.new(email: "test@test.COM")
        @user1.save
        @user2 = User.new(email: "TEST@TEST.com")
        @user2.save
        expect(@user2).not_to be_valid
      end
      it 'should have minimum 6 of password length' do
        @user = User.new({
        name: "Roman", 
        mobile: "6474469950",
        email: "roman.medvedev@gmail.com", 
        user_type_id: "12",
        password: "123", 
        password_confirmation: "123"})
        expect(@user).not_to be_valid
      end
      it 'should valid with minimum 6 of password length' do
        @user = User.new({
        name: "Roman", 
        mobile: "6474469950",
        email: "roman.medvedev@gmail.com", 
        user_type_id: "12",
        password: "123456", 
        password_confirmation: "123456"})
        expect(@user).to be_valid
      end
    end

    describe 'authenticate_with_credentials' do
      it 'should valid when all data is correct' do
      @user = User.create!({
        name: "Roman", 
        mobile: "6474469950",
        email: "medvedev.roman91.mr@gmail.com", 
        password: "123456", 
        password_confirmation: "123456"})
        user = User.authenticate_with_credentials(@user.email, @user.password)
        expect(user).to be_truthy
      end

      it 'should valid with addition spacing' do
        @user = User.create!({
          name: "Roman", 
          mobile: "6474469950",
          email: "medvedev.roman91.mr@gmail.com",  
          password: "123456", 
          password_confirmation: "123456"})
          user = User.authenticate_with_credentials(" medvedev.roman91.mr@gmail.com ", @user.password)
          expect(user.email).to eq(@user.email)
        end
      
        it 'should valid with email case insensitive' do
          @user = User.create!({
            name: "Roman", 
            mobile: "6474469950",
            email: "medvedev.roman91.mr@gmail.com", 
            password: "123456", 
            password_confirmation: "123456"})
            user = User.authenticate_with_credentials("medVEdev.roman91.MR@gmail.com", @user.password)
            expect(user.email).to eq(@user.email)
          end


    end
  
end
