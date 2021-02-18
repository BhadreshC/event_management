class BudgetListsController < ApplicationController
  before_action :set_event
  before_action :set_budget_list, only: %i[edit update destroy]
  before_action :check_user_role, only: [:new, :edit]

  def new
    @budget_list = BudgetList.new
  end

  def edit;end

  def create
    @budget_list = BudgetList.new(budget_list_params)
    current_user.budget_lists << @budget_list
    respond_to do |format|
      if @budget_list.save
        format.html { redirect_to event_path(@event), notice: "Budget list was successfully Added." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @amount = @budget_list.amount
      @title = @budget_list.title
      if @budget_list.update(budget_list_params)
        @budget_list.set_activity(current_user.name, @amount, @title)
        format.html { redirect_to event_path(@event), notice: "Budget list was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @budget_list.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event), notice: "Budget list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  protected
    def check_user_role
      if !current_user.admin?
        redirect_to event_path(@event)
      end
    end

  private
    def set_event
      @event = Event.find_by_id(params[:event_id]) or not_found
    end

    def set_budget_list
      @budget_list = @event.budget_lists.find(params[:id]) or not_found
    end

    def budget_list_params
      params.require(:budget_list).permit(:title, :amount, :event_id)
    end
end
