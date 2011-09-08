class Translation < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  before_validation :translate_input_text

  validates_presence_of :user_id, :language_id, :input_text, :output_text

  # Translates the input text and stores it to the output text
  # At some point, it will do the actual translation, for now it does nothign
  def translate_input_text
    if self.language
      self.output_text = self.language.translate(self.input_text)
    else
      self.output_text = self.input_text
    end
  end
end
