require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  test "layout links" do
    get root_path
    assert_template 'layouts/_header'
    assert_select "a[href=?]", home_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
  end
end
