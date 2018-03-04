require 'test_helper'

class PartNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_number = part_numbers(:one)
  end

  test "should get index" do
    get part_numbers_url
    assert_response :success
  end

  test "should get new" do
    get new_part_number_url
    assert_response :success
  end

  test "should create part_number" do
    assert_difference('PartNumber.count') do
      post part_numbers_url, params: { part_number: { partnumber: @part_number.partnumber } }
    end

    assert_redirected_to part_number_url(PartNumber.last)
  end

  test "should show part_number" do
    get part_number_url(@part_number)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_number_url(@part_number)
    assert_response :success
  end

  test "should update part_number" do
    patch part_number_url(@part_number), params: { part_number: { partnumber: @part_number.partnumber } }
    assert_redirected_to part_number_url(@part_number)
  end

  test "should destroy part_number" do
    assert_difference('PartNumber.count', -1) do
      delete part_number_url(@part_number)
    end

    assert_redirected_to part_numbers_url
  end
end
