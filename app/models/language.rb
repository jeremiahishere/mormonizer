# Stores a collection of words that are applied to a translation to edit the input text
class Language < ActiveRecord::Base
  has_many :translations
  has_many :words

  validates_presence_of :name
end
