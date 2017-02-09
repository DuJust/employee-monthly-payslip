class PayslipsController < ApplicationController
  def input
  end

  def output
    unless params[:attachment].try(:path)
      flash[:alert] = 'There is something wrong with your attachment, please try again.'
      redirect_to input_payslips_path
    end
  end
end
