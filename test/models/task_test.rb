require 'test_helper'
task=Task.new
class TaskTest < ActiveSupport::TestCase
  test "the truth" do
    p Task.all.as_json
    assert_equal true,true
  end
end
