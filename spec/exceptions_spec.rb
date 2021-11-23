require './lib/exceptions'

RSpec.describe Except do
  describe '.except' do
    context 'check_number' do
      it { except(Except.new.is_number?('155')).to eq(true) }
    end

    context 'check_number' do
      it { except(Except.new.is_number?('asd')).to eq(false) }
    end

    context 'check_number' do
      it { except(Except.new.is_number?('-')).to eq(false) }
    end

    context 'check_scale' do
      it { except(Except.new.is_scale?('F')).to eq(true) }
    end

    context 'check_scale' do
      it { except(Except.new.is_scale?('f')).to eq(true) }
    end

    context 'check_scale' do
      it { except(Except.new.is_scale?('s')).to eq(false) }
    end
  end
end
