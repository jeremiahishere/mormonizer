require 'spec_helper'

describe Word do
  it "should respond to language" do
    Word.new.should respond_to :language
  end

  describe "validations" do
    before(:each) do
      @word = Word.new
      @valid_attributes = {
        :language_id => 1,
        :match_word => "dwight",
        :replacement_word => "diapers"
      }
    end

    it "should be valid" do
      @word.attributes = @valid_attributes
      @word.should be_valid
    end

    it "should require language" do
      @word.should have(1).error_on(:language_id)
    end

    it "should require a match word" do
      @word.should have(1).error_on(:match_word)
    end

    it "should require a replacement word" do
      @word.should have(1).error_on(:replacement_word)
    end

    it "should not error if the replacement word is a blank string" do
      @word.replacement_word = ""
      @word.should have(0).error_on(:replacement_word)
    end
  end
end