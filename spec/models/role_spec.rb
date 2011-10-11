require 'spec_helper'

describe Role do
  describe "relationships" do
    before(:each) do
      @role = Role.new
    end

    it { @role.should have_many :user_roles }
    it { @role.should have_many :users }
  end

  describe "validations" do
    before(:each) do
      @role = Role.new
    end

    it { @role.should validate_presence_of :name }
  end
end
