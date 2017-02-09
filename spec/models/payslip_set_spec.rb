require 'rails_helper'

RSpec.describe PayslipSet do
  let(:payslip_set) { PayslipSet.new(csv_file) }

  describe '#payslips' do
    let(:csv_file) { load_fixture('test.csv') }

    subject { payslip_set.payslips }

    it 'should create payslip array by given csv' do
      expect(subject.first.first_name).to eq('David')
      expect(subject.first.last_name).to eq('Rudd')
      expect(subject.first.annual_salary).to eq('60050')
      expect(subject.first.super_rate).to eq('9%')
      expect(subject.first.payment_start_date).to eq('01 March - 31 March')
    end
  end

  describe '#validate' do
    let(:csv_file) { load_fixture('error.csv') }

    it { expect(payslip_set.errors.size).to eq(2) }
  end
end
