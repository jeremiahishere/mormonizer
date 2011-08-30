require 'spec_helper'

describe "translations/index.html.haml" do
  before(:each) do
    assign(:translations, [
      stub_model(Translation,
        :user_id => 1,
        :language_id => 1,
        :input_text => "MyText",
        :output_text => "MyText"
      ),
      stub_model(Translation,
        :user_id => 1,
        :language_id => 1,
        :input_text => "MyText",
        :output_text => "MyText"
      )
    ])
  end

  it "renders a list of translations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
