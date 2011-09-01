require 'spec_helper'

describe Language do
  it "should respond to translations" do
    Language.new.should respond_to :translations
  end

  it "should respond to words" do
    Language.new.should respond_to :words
  end

  describe "validations" do
    before(:each) do
      @language = Language.new
      @valid_attributes = {
        :name => "The annoying language"
      }
    end

    it "should be valid" do
      @language.attributes = @valid_attributes
      @language.should be_valid
    end

    it "should require name" do
      @language.should have(1).error_on(:name)
    end
  end
end
