require 'spec_helper'

describe Company do
  it "has a valid factory" do
    expect(build(:company)).to be_valid
  end

  it { should validate_presence_of :name}
  it { should validate_presence_of :subdomain}
  it { should validate_uniqueness_of :subdomain }

end