require 'spec_helper'

describe Language do
  describe "relationships" do
    before(:each) do
        @language = Language.new
    end
    it "should have many translations" do
      @language.should have_many :translations
    end

    it "should have many words" do
      @language.should have_many :words
    end
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
