require 'rails_helper'

RSpec.describe PayslipsController, type: :controller do
  describe '#input' do
    subject { get :input }

    it { is_expected.to render_template(:input) }
  end

  describe '#output' do
    let(:fixture_file) { 'test.csv' }
    let(:params) { { attachment: fixture_file_upload(fixture_file) } }
    subject { post :output, params: params }

    it { is_expected.to render_template(:output) }
    it 'should assign payslip set' do
      subject
      expect(assigns(:payslip_set)).not_to be_nil
    end

    context 'when attachment is empty' do
      let(:params) { { attachment: '' } }

      it 'should render alert message' do
        subject
        expect(flash[:alert]).to eq('There is something wrong with your attachment, please try again.')
      end

      it { is_expected.to redirect_to(input_payslips_path) }
    end

    context 'when attachment does not exist' do
      let(:params) { { attachment: double(:non_exist_file) } }

      it 'should render alert message' do
        subject
        expect(flash[:alert]).to eq('There is something wrong with your attachment, please try again.')
      end

      it { is_expected.to redirect_to(input_payslips_path) }
    end
  end
end
