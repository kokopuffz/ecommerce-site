require 'rails_helper'

RSpec.describe User, type: :model do

  subject { 
    described_class.new(username: "pudgie",
                        password: "secret",
                        created_at: DateTime.now,
                        updated_at: DateTime.now) 
  }

  it "is valid with valid attributes" do
    # subject.username = "pudgie"
    # subject.password = "secret"
    # subject.created_at = DateTime.now
    # subject.updated_at = DateTime.now

    expect(subject).to be_valid
  end

  it "is not valid without a username" do
    # user = User.new(username: nil)
    subject.username = nil
    # expect(user).to be_valid

    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    # user = User.new(password: nil)
    subject.password = nil
    # expect(user).to be_valid
    expect(subject).to_not be_valid    
  end

  it "is not valid without a created_at" do
    # user = User.new(created_at: DateTime.now)
    subject.created_at = nil
    expect(subject).to_not be_valid 
  end

  it "is not valid without a updated_at" do
    # user = User.new(created_at: DateTime.now)
    subject.updated_at = nil
    expect(subject).to_not be_valid 
  end
end
