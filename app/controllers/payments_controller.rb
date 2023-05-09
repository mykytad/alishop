class PaymentsController < ApplicationController
  def checkout
    @payments = Payment.where(:id => params[:ids])
    @payment_ids = @payments.map do |payment|
      payment.id
    end
  end

  def execute
    @payments = Payment.where(:id => params[:ids])
    redirect_to successful_payments_path
  end

  def successful
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_type, :status, :user_id, :order_id)
  end
end
