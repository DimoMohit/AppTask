require 'test_helper'
user=User.new
class UserTest < ActiveSupport::TestCase
  test "the truth" do
  	# p User.all.as_json
    assert_equal true,true
  end
end
