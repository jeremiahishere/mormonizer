# A word to replace in a language
# The easiest example is changing "dwight" to "diapers"
# Save the two to match word and replacement word
class Word < ActiveRecord::Base
  belongs_to :language

  validates_presence_of :language_id, :match_word
  validate :replacement_word_not_nil

  # Wanted to do a validates presence of but allow empty strings
  # Instead I am doing this
  def replacement_word_not_nil
    if self.replacement_word.nil?
      self.errors.add(:replacement_word, "can't be blank")
    end
  end
end
