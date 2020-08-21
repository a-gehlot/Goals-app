require 'rails_helper'

RSpec.describe "goals/show", type: :view do
  before(:each) do
    @goal = assign(:goal, Goal.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
