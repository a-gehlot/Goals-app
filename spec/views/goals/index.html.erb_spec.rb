require 'rails_helper'

RSpec.describe "goals/index", type: :view do
  before(:each) do
    assign(:goals, [
      Goal.create!(),
      Goal.create!()
    ])
  end

  it "renders a list of goals" do
    render
  end
end
