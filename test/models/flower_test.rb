require "test_helper"

class FlowerTest < ActiveSupport::TestCase
  test "flower  with title true" do
    user = User.new
    user.save
    flower = Flower.new(title:"gele", user_id:user.id)
    assert flower.valid?
  end
  test "flower with title false" do
    flower = Flower.new
    assert !flower.valid?
  end
end
