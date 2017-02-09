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
    pending("todo...")
  end
  describe '#income_tax' do
    pending("todo...")
  end
  describe '#net_income' do
    pending("todo...")
  end
  describe '#super_income' do
    pending("todo...")
  end
end
