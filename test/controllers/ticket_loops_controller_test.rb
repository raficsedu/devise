require 'test_helper'

class TicketLoopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket_loop = ticket_loops(:one)
  end

  test "should get index" do
    get ticket_loops_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_loop_url
    assert_response :success
  end

  test "should create ticket_loop" do
    assert_difference('TicketLoop.count') do
      post ticket_loops_url, params: { ticket_loop: {  } }
    end

    assert_redirected_to ticket_loop_url(TicketLoop.last)
  end

  test "should show ticket_loop" do
    get ticket_loop_url(@ticket_loop)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_loop_url(@ticket_loop)
    assert_response :success
  end

  test "should update ticket_loop" do
    patch ticket_loop_url(@ticket_loop), params: { ticket_loop: {  } }
    assert_redirected_to ticket_loop_url(@ticket_loop)
  end

  test "should destroy ticket_loop" do
    assert_difference('TicketLoop.count', -1) do
      delete ticket_loop_url(@ticket_loop)
    end

    assert_redirected_to ticket_loops_url
  end
end
