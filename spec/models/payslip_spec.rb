require 'rails_helper'

RSpec.describe Payslip do
  let(:payslip) { Payslip.new }
  let(:payment_start_date) { '01 March - 31 March' }
  let(:annual_salary) { '18000' }
  let(:super_rate) { '9%' }

  before do
    payslip.payment_start_date = payment_start_date
    payslip.annual_salary      = annual_salary
    payslip.super_rate         = super_rate

    allow_any_instance_of(CalendarMonth).to receive(:distance).and_return(2)
  end

  describe '#name' do
    let(:first_name) { FFaker::Name.first_name }
    let(:last_name) { FFaker::Name.last_name }

    before do
      payslip.first_name = first_name
      payslip.last_name  = last_name
    end

    subject { payslip.name }

    it { is_expected.to eq("#{first_name} #{last_name}") }
  end

  describe '#pay_period' do
    subject { payslip.pay_period }

    before do
      allow_any_instance_of(CalendarMonth).to receive(:period).and_return('01 March - 31 March')
    end

    it 'should call calendar month for period' do
      is_expected.to eq('01 March - 31 March')
    end
  end

  describe '#gross_income' do
    before do
      allow_any_instance_of(Salary).to receive(:gross_income).and_return(100)
    end

    subject { payslip.gross_income }

    it { is_expected.to eq(200) }
  end

  describe '#income_tax' do
    before do
      allow_any_instance_of(Salary).to receive(:income_tax).and_return(20)
    end

    subject { payslip.income_tax }

    it { is_expected.to eq(40) }
  end

  describe '#net_income' do
    before do
      allow_any_instance_of(Salary).to receive(:net_income).and_return(80)
    end

    subject { payslip.net_income }

    it { is_expected.to eq(160) }
  end

  describe '#super_income' do
    before do
      allow_any_instance_of(Salary).to receive(:super_income).and_return(5)
    end

    subject { payslip.super_income }

    it { is_expected.to eq(10) }
  end
end
