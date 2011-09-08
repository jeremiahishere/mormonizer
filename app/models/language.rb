# Stores a collection of words that are applied to a translation to edit the input text
class Language < ActiveRecord::Base
  has_many :translations
  has_many :words

  validates_presence_of :name

  # Translate text based on the words of the language
  #
  # Note that this translates the words in arbitrary order so if two words match the same string
  # it is not clear which one will do the actual translating
  #
  # @param [String] input_text The text to translate
  # @param [String] The translated text based on applying each word's translation to the text
  def translate(input_text)
    output_text = input_text
    self.words.each do |word|
      output_text = word.translate(output_text)
    end
    return output_text
  end

end
