class Membership::MessagesController < MembershipController
  before_action :set_conversation, only: [:conversation, :create]

  def index
    con = Conversation.arel_table
    @conversations = Conversation.where(con[:from_id].eq(current_user.id).or(con[:to_id].eq(current_user.id)))
  end

  def check_conversation
    @product = Product.find(params[:product_id])
    @conversation = @product.conversations.find_or_create_by(from: current_user, to: @product.user)
    create_message(@conversation)
  end

  def create
    create_message(@conversation)
  end

  def conversation
  end

  private

  def create_message(conversation)
    message = conversation.messages.new(message_params)
    message.user = current_user
    message.save

    redirect_to membership_messages_show_conversation_path(conversation)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
     params.require(:message).permit(:message, :image)
  end
end
