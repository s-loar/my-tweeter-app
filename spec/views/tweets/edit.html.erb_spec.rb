# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "tweets/edit", type: :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      body: "MyText",
      liked_count: 1
    ))
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(@tweet), "post" do

      assert_select "textarea[name=?]", "tweet[body]"

      assert_select "input[name=?]", "tweet[liked_count]"
    end
  end
end
