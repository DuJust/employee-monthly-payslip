require 'rails_helper'

RSpec.describe TaxCalculator do
  let(:calculator) { TaxCalculator.new(annual_salary) }

  describe '#execute' do
    subject { calculator.execute }

    context 'when annual is between 0 to 18200' do
      let(:annual_salary) { BigDecimal.new(18000) }
      it { is_expected.to eq(0) }
    end

    context 'when annual is between 18201 to 37000' do
      let(:annual_salary) { BigDecimal.new(20000) }
      it { is_expected.to eq(29) }
    end

    context 'when annual is between 37001 to 80000' do
      let(:annual_salary) { BigDecimal.new(60050) }
      it { is_expected.to eq(922) }
    end

    context 'when annual is between 37001 to 80000' do
      let(:annual_salary) { BigDecimal.new(120000) }
      it { is_expected.to eq(2696) }
    end

    context 'when annual is between 180000 and over' do
      let(:annual_salary) { BigDecimal.new(190000) }
      it { is_expected.to eq(4921) }
    end
  end
end
