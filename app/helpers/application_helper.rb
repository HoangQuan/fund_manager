module ApplicationHelper

  def vn_to_currency(money) 
    "#{number_to_currency(money, locale: :en, precision: 0)} VND"
  end
end
