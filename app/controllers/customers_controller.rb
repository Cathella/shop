class CustomersController < ApplicationController
  @customers = Customer.all
  
  @conversation = current_account.hato_conversations.build
end
