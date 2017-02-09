require 'rails_helper'

RSpec.describe CalendarMonth do
  let(:date_string) { '01 March - 31 March' }
  let(:parser) { CalendarMonth.new(date_string) }

  describe '#period' do
    subject { parser.period }

    context 'when period is exactly divided by calender month' do
      let(:date_string) { '01 March - 31 March' }
      it { is_expected.to eq('01 March - 31 March') }
    end

    context 'when period is exactly divided by calender month' do
      let(:date_string) { '01 March - 01 April' }

      it 'should remove extract dates' do
        is_expected.to eq('01 March - 31 March')
      end
    end
  end

  describe '#distance' do
    subject { parser.distance }

    context 'when period is exactly divided by calender month' do
      let(:date_string) { '01 March - 31 March' }
      it { is_expected.to eq(1) }
    end

    context 'when period is exactly divided by calender month' do
      let(:date_string) { '01 March - 01 April' }

      it 'should remove extract dates' do
        is_expected.to eq(1)
      end
    end
  end
end
