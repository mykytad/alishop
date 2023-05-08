class PaymentsController < ApplicationController
  def checkout
    @payments = Payment.where(:id => params[:ids])
    @payment_ids = @payments.map do |payment|
      payment.id
    end
  end

  def execute
    redirect_to successful_payment_payments_path
  end

  def successful_payment
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_type, :status, :user_id, :order_id)
  end
end
