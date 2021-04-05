class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @conversation = current_account.hato_conversations.build
  end
end
