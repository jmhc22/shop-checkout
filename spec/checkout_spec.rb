require 'checkout'

describe Shop do

  subject(:shop) { described_class.new }

  describe '#checkout' do
    describe 'Checking out with aBc will return -1' do
      it { expect(shop.checkout('aBc')).to eq -1 }
    end

    describe 'Checking out with AA will return 100' do
      it { expect(shop.checkout('AA')).to eq 100 }
    end

    describe 'Checking out with -B8x will return -1' do
      it { expect(shop.checkout('-B8x')).to eq -1 }
    end

    describe 'Checking out with 18 will return -1' do
      it { expect(shop.checkout(18)).to eq -1 }
    end

    describe 'Checking out with ABCD will return 115' do
      it { expect(shop.checkout('ABCD')).to eq 115 }
    end

    describe 'Checking out with AAA will return 130' do
      it { expect(shop.checkout('AAA')).to eq 130 }
    end

    describe 'Checking out with AAA will return 130' do
      it { expect(shop.checkout('AAAAAA')).to eq 260 }
    end

    describe 'Checking out with BBBB will return 90' do
      it { expect(shop.checkout('BBBB')).to eq 90 }
    end

    describe 'Checking out with AAAAA will return 230' do
      it { expect(shop.checkout('AAAAA')).to eq 230 }
    end

    describe 'Checking out with AAAAAAb will return 230' do
      it { expect(shop.checkout('AAAAAAb')).to eq -1 }
    end

    describe 'Checking out with AAABB will return 175' do
      it { expect(shop.checkout('AABBA')).to eq 175 }
    end

  end

end
