class ProductMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.in_stock.subject
  #
  def in_stock
    @product = params[:product]
    recipient = params[:subscriber]&.email || "to@example.org"
    mail to: recipient
  end
end
