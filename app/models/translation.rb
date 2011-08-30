class Translation < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  validates_presence_of :user_id, :language_id, :input_text, :output_text
end
