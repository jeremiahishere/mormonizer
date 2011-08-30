require 'spec_helper'

describe "translations/new.html.haml" do
  before(:each) do
    assign(:translation, stub_model(Translation,
      :user_id => 1,
      :language_id => 1,
      :input_text => "MyText",
      :output_text => "MyText"
    ).as_new_record)
  end

  it "renders new translation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => translations_path, :method => "post" do
      assert_select "input#translation_user_id", :name => "translation[user_id]"
      assert_select "input#translation_language_id", :name => "translation[language_id]"
      assert_select "textarea#translation_input_text", :name => "translation[input_text]"
      assert_select "textarea#translation_output_text", :name => "translation[output_text]"
    end
  end
end
