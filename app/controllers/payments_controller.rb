class PaymentsController < ApplicationController
  def checkout
    @payments = Payment.where(:id => params[:ids])
    @payment_ids = @payments.map do |payment|
      payment.id
    end
  end

  def execute
    @payments = Payment.where(:id => params[:ids])

    @payments.each do |payment|
      payment.order.sum_price
      payment.payment_type = params[:payment_type]
      payment.save

      if payment.payment_type == "MasterCard/VISA"
        credit_pay = CreditPay.new
        credit_pay_status = credit_pay.pay(
          payment.order.sum_price,
          params[:credit_number],
          params[:expiration],
          params[:cvv]
        )
        if credit_pay_status
          payment.status = true
          payment.save
        end
      end
    end
    redirect_to successful_payments_path
  end

  def successful
  end
end
