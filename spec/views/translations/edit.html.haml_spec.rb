require 'spec_helper'

describe "translations/edit.html.haml" do
  before(:each) do
    @translation = assign(:translation, stub_model(Translation,
      :user_id => 1,
      :language_id => 1,
      :input_text => "MyText",
      :output_text => "MyText"
    ))
  end

  it "renders the edit translation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => translations_path(@translation), :method => "post" do
      assert_select "input#translation_user_id", :name => "translation[user_id]"
      assert_select "input#translation_language_id", :name => "translation[language_id]"
      assert_select "textarea#translation_input_text", :name => "translation[input_text]"
      assert_select "textarea#translation_output_text", :name => "translation[output_text]"
    end
  end
end