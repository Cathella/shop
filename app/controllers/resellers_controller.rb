class ResellersController < ApplicationController
  def index
    @resellers = Reseller.all
    @conversation = current_account.hato_conversations.build
  end
end
