require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, 'Instrumente'
    assert_equal full_title("Hilfe"), 'Hilfe | Instrumente'
  end
end