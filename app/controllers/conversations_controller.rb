class ConversationsController < ApplicationController
  def index
    @conversations = current_account.my_conversations_includes(:sender)
  end

  def create
    @conversation = current_account.hato_conversations.build(conversation_params)
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      redirect_to :conversations, notice: @conversation.errors
    end
  end

  def show
    @conversation = Denshobato::Conversation.find(params[:id])
    @message_form = current_account.hato_messages.build
    @messages = @conversation.messages.includes(:author)
  end

  def destroy
    @conversation = Deshobato::Conversation.find(params[:id])
    redirect_to :conversations if @conversation.destroy
  end

  private

  def conversation_params
    params.require(:deshobato_conversation).permit(:sender_id, :sender_type, :recipient_id, :recipient_type)
  end
end
