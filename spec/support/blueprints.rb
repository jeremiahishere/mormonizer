require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end
#
Translation.blueprint do
  user { User.make }
  language { Language.make }
  input_text { "generic text" }
end

#User.blueprint do
#end

Word.blueprint do
  language { Language.make}
  match_word { "dwight" }
  replacement_word { "diapers" }
end

Language.blueprint do
  name { "Annoying" }
  description { "This language is here to be annoying" }
end
