require 'rails_helper'

RSpec.describe PayslipSet do
  let(:csv_file) { load_fixture('test.csv') }
  let(:payslip_set) { PayslipSet.new(csv_file) }

  describe '#payslips' do
    subject { payslip_set.payslips }

    it 'should create payslip array by given csv' do
      expect(subject.first.first_name).to eq('David')
      expect(subject.first.last_name).to eq('Rudd')
      expect(subject.first.annual_salary).to eq('60050')
      expect(subject.first.super_rate).to eq('9%')
      expect(subject.first.payment_start_date).to eq('01 March - 31 March')
    end
  end
end
