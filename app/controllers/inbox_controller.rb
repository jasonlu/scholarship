class InboxController < ApplicationController

  before_filter :authenticate_user!

  def index
    @inboxes = current_user.inboxes
    #@messages = current_user.messages
  end

  def show
    @inbox = Inbox.find(params[:inbox_id])
    #@message = Message.find(params[:id])
    @message = @inbox.message
    
    @inbox.read = true
    @inbox.save
  end

  def read
  end

  def delete
  end
end
