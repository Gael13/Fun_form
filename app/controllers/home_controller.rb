class HomeController < ApplicationController

  def index
    @messages = Message.all
    @fun_form = FunForm.where(id: 1).first_or_initialize
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

  def create_form
    @fun_form = FunForm.where(id: 1).first_or_initialize

    respond_to do |format|
      if @fun_form.update(fun_form_params)
        format.html { redirect_to root_path, notice: 'Form was successfully updated.' }
        format.json { render :show, :status => :created, location: @fun_form }
      else
        format.html { redirect_to root_path_path }
        format.xml  { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :content, :league_id)
  end

  def fun_form_params
    params.require(:fun_form).permit(:quest1, :quest2, :quest3, :quest4)
  end

end
