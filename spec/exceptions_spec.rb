require './lib/exceptions'

RSpec.describe Except do
  describe '.except' do
    context 'check_number' do
      it { expect(Except.new.number?('155')).to eq(true) }
    end

    context 'check_number' do
      it { expect(Except.new.number?('asd')).to eq(false) }
    end

    context 'check_number' do
      it { expect(Except.new.number?('-')).to eq(false) }
    end

    context 'check_scale' do
      it { expect(Except.new.scale?('F')).to eq(true) }
    end

    context 'check_scale' do
      it { expect(Except.new.scale?('f')).to eq(true) }
    end

    context 'check_scale' do
      it { expect(Except.new.scale?('s')).to eq(false) }
    end
  end
end
