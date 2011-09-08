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

  describe "translate method" do
    before(:each) do
      @language = Language.new
      @word = Word.new
      @language.stub!(:words).and_return([@word])
    end

    it "should call translate for eery word in the language" do
      @word.should_receive(:translate)
      @language.translate("")
    end

    it "should return the translated text" do
      @word.stub!(:translate).and_return("hello")
      @language.translate("").should == "hello"
    end
  end
end
