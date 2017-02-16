class OrderMailer < ActionMailer::Base
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    mail(to: @order.email , subject: @order.id )
  end
end
