require 'spec_helper'

module BalihooLpcClient
  describe Connection do
    let(:config) { Configuration.new }

    subject { Connection.new(config: config) }

    describe '.initialize' do
      it 'sets config for class' do
        expect(subject.config).to eq config
      end
    end

    describe '.authenticate!' do
      it 'creates an instance of Request::Authentication' do
        expect(Request::Authentication).to receive(:new).with(connection: subject).and_call_original
        allow_any_instance_of(Request::Authentication).to receive(:authenticate!)
        subject.authenticate!
      end

      it 'calls authenticate! on Request::Authentication instance' do
        expect_any_instance_of(Request::Authentication).to receive(:authenticate!)
        subject.authenticate!
      end
    end
  end
end
