class ExpensesController < ApplicationController
  before_action :set_event
  before_action :set_expense, only: %i[edit update destroy]

  def new
    @expense = current_user.expenses.new
  end

  def edit;end

  def create
    @expense = current_user.expenses.new(expense_params)
    respond_to do |format|
      if @expense.save
        format.html { redirect_to event_path(@event), notice: "Expense was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @description = @expense.description
      @date = @expense.date
      @amount = @expense.amount
      if @expense.update(expense_params)
        @expense.set_activity(current_user.name, @description, @date, @amount)
        format.html { redirect_to event_path(@event), notice: "Expense was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event), notice: "Expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = Event.find_by_id(params[:event_id]) or not_found
    end

    def set_expense
      @expense = @event.expenses.find(params[:id]) or not_found
    end

    def expense_params
      params.require(:expense).permit(:description, :date, :amount, :event_id)
    end
end
