require 'spec_helper'

describe UserRole do
  describe "relationships" do
    before(:each) do
      @user_role = UserRole.new
    end

    it { @user_role.should belong_to :user }
    it { @user_role.should belong_to :role }
  end

  describe "validations" do
    before(:each) do
      @user_role = UserRole.new
    end

    it { @user_role.should validate_presence_of :user_id }
    it { @user_role.should validate_presence_of :role_id }
  end
end
