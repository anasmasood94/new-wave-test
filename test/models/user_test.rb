require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(first_name: 'John', last_name: 'Jack', email: 'john@example.com', password: 'pass1234', password_confirmation: 'pass1234')
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(first_name: 'John', last_name: 'Jack', password: 'pass1234', password_confirmation: 'pass1234')
    refute user.valid?, 'user is valid without an email'
    assert_not_nil user.errors[:email], 'no validation error for email present'
  end

  test 'invalid with duplicate email' do
    user1 = User.create(first_name: 'John', last_name: 'Jack', email: 'john@example.com', password: 'pass1234', password_confirmation: 'pass1234')
    user2 = User.new(first_name: 'John', last_name: 'Jack', email: 'john@example.com', password: 'pass1234', password_confirmation: 'pass1234')
    refute user2.valid?, 'user is valid with duplicate email'
    assert_not_nil user2.errors[:email], 'has already been taken'
  end

  test 'invalid without password' do
    user = User.new(first_name: 'John', last_name: 'Jack', email: 'john@example.com',)
    refute user.valid?, 'user is valid without a password'
    assert_not_nil user.errors[:password], 'no validation error for password present'
  end
end
