module BalihooLpcClient
  describe Connection do
    let(:config) { Configuration.new }

    subject { Connection.new(config: config) }

    describe '.initialize' do
      it 'sets config for class' do
        expect(subject.config).to eq config
      end
    end

    describe '.authorize!' do
      
    end
  end
end
