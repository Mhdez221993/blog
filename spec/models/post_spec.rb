require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(name: 'John', bio: 'Jons Bio', posts_counter: 0)
  end

  it 'eager loads all files without errors' do
    expect { Rails.application.eager_load! }.not_to raise_error
  end

  it 'is valid with valid attributes' do
    post = @user.posts.new(title: 'Lord', text: 'Best', comments_counter: 0, likes_counter: 0)
    expect(post).to be_valid
  end

  it 'is valid presence of comments_counter' do
    post = @user.posts.new(title: 'Lord of the rings', text: 'Best seller book')
    expect(post).to be_invalid
  end

  it 'is valid comments_counter >= 0' do
    post = @user.posts.new(title: 'Lord of the rings', text: 'Best seller book', comments_counter: -2, likes_counter: 0)
    expect(post).to be_invalid
  end

  it 'is valid the presence of title' do
    post = @user.posts.new(text: 'Best seller book', comments_counter: 2, likes_counter: 0)
    expect(post).to be_invalid
  end

  it 'is valid title is not black' do
    post = @user.posts.new(title: '', text: 'Best seller book', comments_counter: 2, likes_counter: 0)
    expect(post).to be_invalid
  end
end
