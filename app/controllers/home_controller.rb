class HomeController < ApplicationController

  def index
    @messages = Message.all
  end

  def create_message
  	@messages = Message.all
    @message = Message.new(message_params)
    @message.save
    respond_to do |format|
      format.js
    end
  end

  def destroy_message
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:name, :content, :league_id)
  end

end
