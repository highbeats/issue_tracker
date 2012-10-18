class TicketsController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_manager!, only: :index

  def index
    @tickets = Ticket.all
    respond_with @tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
    respond_with @ticket
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.save
    respond_with @ticket do |format|
      format.html do
        if @ticket.errors.any?
          flash[:alert] = @ticket.errors.to_a
          render action: :new
        else
          flash[:notice] = 'Ticket created! We will review it asap!'
          redirect_to root_url
        end
      end
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
    respond_with @ticket
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update_attributes(params[:ticket])
    respond_with @ticket do |format|
      format.html do
        if @ticket.errors.any?
          flash[:alert] = @ticket.errors.to_a
          render action: :edit
        else
          flash[:notice] = 'Ticket updated!'
          redirect_to tickets_url
        end
      end
    end
  end

  def destroy
  end
end
