module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    # note the weird hack when matching the model
    # in almost every case, it should match only the plural version of the model
    # but in the person model, it needs to match people with no plural
    when /^the (.+?) \- (.+?[s]*)(?:'s)? index page$/     
      polymorphic_path([$1.to_sym, $2.to_sym])

    when /^the (.+?) \- #{capture_model}(?:'s)? view page for #{capture_model}$/     
      polymorphic_path([$1.to_sym, model!($3)])    

    when /^the (.+?) \- #{capture_model}(?:'s)? edit page for #{capture_model}$/     
      polymorphic_path([$1.to_sym, model!($3)], :action => "edit")    

    # due to pickle limitations, we can't use polymorphic path
    # this is better than manually writing out all the new page paths
    # but prone to breaking
    when /^the (.+?) \- (.+?)(?:'s)? new page$/     
      eval("new_" + $1 + "_" + $2.singularize + "_path")

    when /^the (.+?) \- #{capture_model}(?:'s)? (.+?) page$/  
      polymorphic_path([$1.to_sym, model!($2)], :action => $3)   

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
          path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
