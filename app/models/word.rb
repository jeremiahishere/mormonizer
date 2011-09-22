# A word to replace in a language
# The easiest example is changing "dwight" to "diapers"
# Save the two to match word and replacement word
class Word < ActiveRecord::Base
  belongs_to :language

  # because of the way the nested words work on the language page, language id cannot be mandatory on create
  # could add :on => :update if needed
  # validates_presence_of :language_id
  
  validates_presence_of :match_word
  validate :replacement_word_not_nil

  # Wanted to do a validates presence of but allow empty strings
  # Instead I am doing this
  def replacement_word_not_nil
    if self.replacement_word.nil?
      self.errors.add(:replacement_word, "can't be blank")
    end
  end

  # given a word, find all matches, and replacement
  # @param [String] input_word The word to change
  # @return [String] The word with changes applied
  def translate(input_word)
    input_word.gsub(self.match_word, self.replacement_word)
  end
end
