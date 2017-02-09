require 'rails_helper'

RSpec.describe Payslip do
  let(:payslip) { Payslip.new }

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
    pending("todo...")
  end

  describe '#gross_income' do
    let(:annual_salary) { 60050 }

    it 'should divide months of year and round' do
      payslip.annual_salary = annual_salary
      expect(payslip.gross_income).to eq(5004)
    end
  end

  describe '#income_tax' do
    let(:income_tax) { 922 }
    let(:annual_salary) { 60050 }

    before do
      payslip.annual_salary = annual_salary
      allow_any_instance_of(TaxCalculator).to receive(:execute).and_return(income_tax)
    end

    subject { payslip.income_tax }

    it { is_expected.to eq(income_tax) }
  end

  describe '#net_income' do
    let(:annual_salary) { 60050 }

    before do
      payslip.annual_salary = annual_salary
    end

    subject { payslip.net_income }

    it { is_expected.to eq(4082) }
  end
  describe '#super_income' do
    pending("todo...")
  end
end
