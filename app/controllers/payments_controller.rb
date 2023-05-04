class PaymentsController < ApplicationController
  def checkout
    @payments = Payment.where(:id => params[:ids])
  end

  def execute
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_type, :status, :user_id, :order_id)
  end
end
