module ApplicationHelper
  def current_account
    current_reseller || current_customer
  end

  def current_account_signed_in?
    reseller_signed_in? || customer_signed_in?
  end
end
