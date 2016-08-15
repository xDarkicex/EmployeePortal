class MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_message, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_admin, only: [:destroy]
  def index
    @messages = Message.all
  end
  def show
  end

  def new
    @message = Message.new()
  end

  def edit
  end
  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    # @message.user = current_user
    # @message.user = current_user;
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    if @message.destroy
        redirect_to messages_url, notice: "message deleted."
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:title, :body, :private, :user_id)
    end
end
