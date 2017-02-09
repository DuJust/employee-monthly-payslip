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
    before do
      payslip.annual_salary = annual_salary
    end

    subject { payslip.income_tax }

    context 'when annual is between 0 to 18200' do
      let(:annual_salary) { 18000 }
      it { is_expected.to eq(0) }
    end

    context 'when annual is between 18201 to 37000' do
      let(:annual_salary) { 20000 }
      it { is_expected.to eq(29) }
    end

    context 'when annual is between 37001 to 80000' do
      let(:annual_salary) { 60050 }
      it { is_expected.to eq(922) }
    end

    context 'when annual is between 37001 to 80000' do
      let(:annual_salary) { 120000 }
      it { is_expected.to eq(2696) }
    end

    context 'when annual is between 180000 and over' do
      let(:annual_salary) { 190000 }
      it { is_expected.to eq(4921) }
    end
  end

  describe '#net_income' do
    pending("todo...")
  end
  describe '#super_income' do
    pending("todo...")
  end
end
