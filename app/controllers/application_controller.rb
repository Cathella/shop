class ApplicationController < ActionController::Base
  private

  def current_account
    current_reseller || current_customer
  end
end
