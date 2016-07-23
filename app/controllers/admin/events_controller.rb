class Admin::Admin::EventsController < ApplicationController
  before_action :authenticate_admin_admin!
  # before_action :set_current_week
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # GET /events
  def index
    @events = Admin::Event.all
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Admin::Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Admin::Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Admin::Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Admin::Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Admin::Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Admin::Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :description, :facilitator)
    end
end
