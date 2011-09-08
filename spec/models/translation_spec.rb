require 'spec_helper'

describe Translation do
  it "should respond to user" do
    Translation.new.should respond_to :user
  end

  it "should respond to language" do
    Translation.new.should respond_to :language
  end

  describe "validations" do
    before(:each) do
      @translation = Translation.new
      @valid_attributes = {
        :user_id => 1,
        :language_id => 2,
        :input_text => 3
      }
    end
    it "should be valid" do
      @translation.attributes = @valid_attributes
      @translation.should be_valid
    end

    it "should require a user" do
      @translation.should have(1).error_on(:user_id)
    end

    it "should require a langauge" do
      @translation.should have(1).error_on(:language_id)
    end

    it "should require input text" do
      @translation.should have(1).error_on(:input_text)
    end

    it "should require output text" do
      @translation.should have(1).error_on(:output_text)
    end
  end

  describe "translate_input_text" do
    before(:each) do
      @translation = Translation.new
    end

    it "should be called before validation" do
      @translation.should_receive(:translate_input_text)
      @translation.valid?
    end

  end
  describe "translate_input_text method" do
    before(:each) do
      @translation = Translation.new
      @language = Language.new
    end

    it "should save the input text to the output text if no language is specified" do
      @translation.input_text = "hello world"
      @translation.valid?
      @translation.output_text.should == "hello world"
    end

    it "should call the langauge's translate function is the language is specified" do
      @translation.language = @language
      @language.should_receive(:translate).and_return("goodbye world")
      @translation.translate_input_text.should == "goodbye world"
    end
  end
end
