class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :check_user_role, :set_event_categories,only: [:new, :edit]
  skip_before_action :authenticate_user!, only: :events_list
  def events_list
    @all_events = Event.includes(:event_category).all
  end
  def index
    @events = current_user.events.all
  end

  def show
    @total_expense = Expense.where(event_id: @event.id).sum(:amount)
    @total_budget = BudgetList.where(event_id: @event.id).sum(:amount)
    @remaining_amount = @total_budget - @total_expense
    @event_expenses = @event.expenses.order(updated_at: :desc)
    @event_budgets_list = @event.budget_lists.order(updated_at: :desc)
  end

  def new
    @event = current_user.events.new

  end

  def edit;end

  def create
    @event = current_user.events.new(event_params)
    current_user.events << @event
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
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
    def set_event_categories
      @event_categories = EventCategory.where(status: "active").all
    end
    def set_event
      @event = current_user.events.find(params[:id]) or not_found
    end
    def event_params
      params.require(:event).permit(:title, :venue, :start_date, :end_date, :event_category_id, :event_type, :event_fees, :person_capicity, :event_link, :time_to_start, :paid, :image)
    end
end
