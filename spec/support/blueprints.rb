require 'machinist/active_record'
require 'faker'

Language.blueprint do
  name { "Annoying" }
  description { "This language is here to be annoying" }
end

Role.blueprint do
  name { Faker::Lorem.words(1).first }
end

Translation.blueprint do
  user { User.make }
  language { Language.make }
  input_text { "generic text" }
end

User.blueprint do
  email { Faker::Internet.email }
  password { "password" }
  password_confirmation { "password" }
end

UserRole.blueprint do
  user { User.make }
  role { Role.make }
end

Word.blueprint do
  language { Language.make}
  match_word { "dwight" }
  replacement_word { "diapers" }
end
