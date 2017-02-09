require 'rails_helper'

RSpec.describe Salary do
  let(:annual_salary) { 60050 }
  let(:super_rate) { '9%' }
  let(:salary) { Salary.new(annual_salary, super_rate) }

  describe '#gross_income' do
    it 'should divide months of year and round' do
      expect(salary.gross_income).to eq(5004)
    end
  end

  describe '#income_tax' do
    let(:income_tax) { 922 }
    let(:annual_salary) { 60050 }

    before do
      allow_any_instance_of(TaxCalculator).to receive(:execute).and_return(income_tax)
    end

    subject { salary.income_tax }

    it { is_expected.to eq(income_tax) }
  end

  describe '#net_income' do
    subject { salary.net_income }

    it { is_expected.to eq(4082) }
  end

  describe '#super_income' do
    subject { salary.super_income }

    it { is_expected.to eq(450) }
  end
end
