require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(build(:admin_user)).to be_valid
  end

  it { should validate_presence_of :username}
  it { should validate_presence_of :email}
  it { should validate_presence_of :password}
  it { should validate_presence_of :password_confirmation}
  it { should validate_presence_of :name}

end