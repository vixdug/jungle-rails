require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:user) { User.new(
      first_name: 'Vixx',
      last_name: 'Duggan',
      email:'testing.email@email.com',
      password: 'jungle',
      password_confirmation: 'jungle')}
    let(:user_copy) { User.new(
      first_name: 'Vixx',
      last_name: 'Duggan',
      email:'testing.email@email.com',
      password: 'jungle',
      password_confirmation: 'jungle')}

    it 'Should save to db if it has a first_name, last_name, email, password, and password confirmation' do
      user.save
      expect(user).to be_persisted
      expect(user.id).to be_present
    end

    it 'Should not save with no password' do
      user.password = nil
      user.save
      expect(user).to_not be_persisted
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include('Password can\'t be blank')
    end

    it'Should not save when password is less than three characters' do
      user.password = 'hi'
      user.save
      expect(user).to_not be_persisted
      expect(user.errors.full_messages).to include('Password is too short (minimum is 3 characters)')
    end

    it 'Should not save with no password confirmation' do
      user.password_confirmation = nil
      user.save
      expect(user).to_not be_persisted
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include('Password confirmation can\'t be blank')
    end

    it 'Should not save when password does not match password confirmation' do
      user.password_confirmation = 'not hello'
      user.save
      expect(user).to_not be_persisted
      expect(user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
    end

    it 'Should not save without an first name' do
      user.first_name = nil
      user.save
      expect(user).to_not be_persisted
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include('First name can\'t be blank')
    end

    it 'Should not save without a last name' do
      user.last_name = nil
      user.save
      expect(user).to_not be_persisted
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include('Last name can\'t be blank')
    end

    it 'Should not save without a email name' do
      user.email = nil
      user.save
      expect(user).to_not be_persisted
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include('Email can\'t be blank')
    end

    it 'Should not save if email is already in use' do
      user.save
      user_copy.save
      expect(user_copy).to_not be_persisted
      expect(user_copy.errors.full_messages).to include('Email has already been taken')
    end

    it 'Should save not save if email is in use and written in different case' do
      user_copy.email = 'testing.email@email.com'
      user.save
      user_copy.save
      expect(user_copy).to_not be_persisted
      expect(user_copy.errors.full_messages).to include('Email has already been taken')
    end

  end
end

#TODO: validations
# It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique and case sensitivity should not be taken into account (TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required
