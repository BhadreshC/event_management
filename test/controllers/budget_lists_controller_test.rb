require "test_helper"

class BudgetListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @budget_list = budget_lists(:one)
  end

  test "should get index" do
    get budget_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_budget_list_url
    assert_response :success
  end

  test "should create budget_list" do
    assert_difference('BudgetList.count') do
      post budget_lists_url, params: { budget_list: { amount: @budget_list.amount, title: @budget_list.title } }
    end

    assert_redirected_to budget_list_url(BudgetList.last)
  end

  test "should show budget_list" do
    get budget_list_url(@budget_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_budget_list_url(@budget_list)
    assert_response :success
  end

  test "should update budget_list" do
    patch budget_list_url(@budget_list), params: { budget_list: { amount: @budget_list.amount, title: @budget_list.title } }
    assert_redirected_to budget_list_url(@budget_list)
  end

  test "should destroy budget_list" do
    assert_difference('BudgetList.count', -1) do
      delete budget_list_url(@budget_list)
    end

    assert_redirected_to budget_lists_url
  end
end
