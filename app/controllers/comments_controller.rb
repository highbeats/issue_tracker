class CommentsController < ApplicationController
  respond_to :html, :json

  before_filter :load_ticket, only: [ :new, :create ]

  def index
  end

  def new
    @comment = @ticket.comments.new
    respond_with @comment
  end

  def create
    @comment = @ticket.comments.new(params[:comment])
    @comment.save
    respond_with @comment do |format|
      format.html do
        if @comment.errors.any?
          flash[:alert] = @comment.erros.to_a
          render action: :new
        else
          flash[:notice] = 'Comment created!'
          redirect_to edit_ticket_path(@ticket)
        end
      end
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def load_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
