class PayslipsController < ApplicationController
  def input
  end

  def output
    file_path = params[:attachment].try(:path)
    unless file_path
      flash[:alert] = 'There is something wrong with your attachment, please try again.'
      redirect_to input_payslips_path
    else
      @payslip_set = PayslipSet.new(file_path)
    end
  end
end
