require 'spec_helper'

describe "translations/show.html.haml" do
  before(:each) do
    @translation = assign(:translation, stub_model(Translation,
      :user_id => 1,
      :language_id => 1,
      :input_text => "MyText",
      :output_text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
