require './lib/calculate'

RSpec.describe Calculate do
  describe '.temperature' do
    context 'convert_from_C_to_F' do
      it { expect(Calculate.new('0', 'C').convert_to_f).to eq(32) }
    end

    context 'convert_from_C_to_K' do
      it { expect(Calculate.new('51', 'c').convert_to_k).to eq(324.15) }
    end

    context 'convert_from_K_to_C' do
      it { expect(Calculate.new('51', 'K').convert_to_c).to eq(-222.15) }
    end

    context 'convert_from_K_to_F' do
      it { expect(Calculate.new('51', 'k').convert_to_f).to eq(-367.87) }
    end

    context 'convert_from_F_to_C' do
      it { expect(Calculate.new('51', 'F').convert_to_c).to eq(10.56) }
    end

    context 'convert_from_F_to_K' do
      it { expect(Calculate.new('51', 'f').convert_to_k).to eq(283.71) }
    end
  end
end
