class UsersController < ApplicationController
  before_action :set_event, only: [:add_member, :check_user_role]
  before_action :check_user_role

  def add_member
    @user = @event.users.new
  end

  def create_member
    @event = Event.find(params[:event_id])
    @user = User.new(users_params)
    respond_to do |format|
      if @user.save
        @event.users << @user
        session[:user_id] = @user.id
        format.html { redirect_to event_path(@event), notice: "Confirmation mail has been sended to the #{@user.email },Please confim the mail after you can login " }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :add_member }
        format.json { render json: event_add_member_path(@event), status: :unprocessable_entity }
      end
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
      @event = Event.find_by(params[:id]) or not_found
    end
    def users_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role, :number, :name)
    end
end
