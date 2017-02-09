require 'rails_helper'

RSpec.describe PayslipValidator do
  let(:payslip) { Payslip.new }
  let(:annual_salary) { '100' }
  let(:super_rate) { '9%' }
  let(:payment_start_date) { '01 March - 31 March' }

  before do
    payslip.annual_salary      = annual_salary
    payslip.super_rate         = super_rate
    payslip.payment_start_date = payment_start_date
    payslip.valid?
  end

  describe 'annual_salary' do
    context 'when it is negative number' do
      let(:annual_salary) { '-1' }

      it { expect(payslip.errors[:annual_salary]).to eq(["'-1' is not a valid number."]) }
    end

    context 'when it is not a number' do
      let(:annual_salary) { 'a' }

      it { expect(payslip.errors[:annual_salary]).to eq(["'a' is not a valid number."]) }
    end
  end

  describe 'super_rate' do
    context 'when it is less than 0%' do
      let(:super_rate) { '-1' }

      it { expect(payslip.errors[:super_rate]).to eq(["'-1' is not a valid percentage."]) }
    end

    context 'when it is larger than 50%' do
      let(:super_rate) { '51%' }

      it { expect(payslip.errors[:super_rate]).to eq(["'51%' is not a valid percentage."]) }
    end

    context 'when it is wrong format' do
      let(:super_rate) { '1' }

      it { expect(payslip.errors[:super_rate]).to eq(["'1' is not a valid percentage."]) }
    end
  end

  describe 'payment_start_date' do
    context 'when there is only one date' do
      let(:payment_start_date) { '01 March' }

      it { expect(payslip.errors[:payment_start_date]).to eq(["\'01 March\' is not a valid date range."]) }
    end

    context 'when there is invalid date' do
      let(:payment_start_date) { '01 March - 32 March' }

      it { expect(payslip.errors[:payment_start_date]).to eq(["'01 March - 32 March' is not a valid date range."]) }
    end

    context 'when the last date is earlier than the first date' do
      let(:payment_start_date) { '31 March - 01 March' }

      it { expect(payslip.errors[:payment_start_date]).to eq(["'31 March - 01 March' is not a valid date range."]) }
    end
  end
end
