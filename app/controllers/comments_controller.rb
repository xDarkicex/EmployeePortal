class CommentsController < ApplicationController
  before_action :set_help_ticket, only: :index
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @help_ticket.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    if params[:help_ticket_id]
      puts "Ayy"
      HelpTicket.find(params[:help_ticket_id])
    end
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params);
    # @comment = HelpTicket.find(params[:help_ticket_id]).comments.create(comment_params)
    @comment.user = current_user
    # ticket = HelpTicket.find(params[:help_ticket_id])
    respond_to do |format|
      if @comment.save
        puts "Got "+params.to_json
        if @comment.comment_id
          puts "Got comment_id"
          parent = Comment.find(@comment.comment_id)
          parent.comments<<@comment
          parent.save
        end
        parent = HelpTicket.find(@comment.help_ticket_id)
        parent.comments<<@comment
        parent.save
        # ticket.save
        format.html { redirect_to parent, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    parent = @comment.help_ticket
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to parent, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_help_ticket
      @help_ticket = HelpTicket.find(params[:help_ticket_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :body,:help_ticket_id,:comment_id)
    end
end
