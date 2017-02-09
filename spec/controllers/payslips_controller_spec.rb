require 'rails_helper'

RSpec.describe PayslipsController, type: :controller do
  describe '#index' do
    subject { get :index }

    it { is_expected.to render_template(:index) }
  end

  describe '#output' do
    let(:fixture_file) { 'test.csv' }
    let(:params) { { attachment: fixture_file_upload(fixture_file) } }
    subject { post :upload, params: params }

    it { is_expected.to render_template(:index) }
    it 'should assign payslip set' do
      subject
      expect(assigns(:payslip_set)).not_to be_nil
    end

    context 'when attachment is empty' do
      let(:params) { { attachment: '' } }

      it 'should render alert message' do
        subject
        expect(flash.now[:alert]).to eq('There is something wrong with your attachment, please try again.')
      end

      it { is_expected.to render_template(:index) }
    end

    context 'when attachment does not exist' do
      let(:params) { { attachment: double(:non_exist_file) } }

      it 'should render alert message' do
        subject
        expect(flash.now[:alert]).to eq('There is something wrong with your attachment, please try again.')
      end

      it { is_expected.to render_template(:index) }
    end
  end
end
