class PayslipsController < ApplicationController
  def index
  end

  def upload
    file_path = params[:attachment].try(:path)
    unless file_path
      flash.now[:alert] = 'There is something wrong with your attachment, please try again.'
    else
      @payslip_set = PayslipSet.new(file_path)
    end

    render :index
  end
end
