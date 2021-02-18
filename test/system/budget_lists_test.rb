require "application_system_test_case"

class BudgetListsTest < ApplicationSystemTestCase
  setup do
    @budget_list = budget_lists(:one)
  end

  test "visiting the index" do
    visit budget_lists_url
    assert_selector "h1", text: "Budget Lists"
  end

  test "creating a Budget list" do
    visit budget_lists_url
    click_on "New Budget List"

    fill_in "Amount", with: @budget_list.amount
    fill_in "Title", with: @budget_list.title
    click_on "Create Budget list"

    assert_text "Budget list was successfully created"
    click_on "Back"
  end

  test "updating a Budget list" do
    visit budget_lists_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @budget_list.amount
    fill_in "Title", with: @budget_list.title
    click_on "Update Budget list"

    assert_text "Budget list was successfully updated"
    click_on "Back"
  end

  test "destroying a Budget list" do
    visit budget_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Budget list was successfully destroyed"
  end
end
