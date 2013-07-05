class InboxController < ApplicationController

  before_filter :authenticate_user!

  def index
    @messages = current_user.messages
  end

  def show
  end

  def read
  end

  def delete
  end
end
