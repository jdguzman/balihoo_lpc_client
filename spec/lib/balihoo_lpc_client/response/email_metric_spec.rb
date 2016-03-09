require 'spec_helper'

module BalihooLpcClient
  module Response
    describe EmailMetric do
      let(:params) do
        {
          'tacticIds' => [1],
          'channel' => 'Email',
          'sends' => 45,
          'opens' => 12,
          'clicks' => 12,
          'delivered' => 40,
          'bounced' => 1,
          'unsubscribed' => 2,
          'markedSpam' => 2
        }
      end

      subject { described_class.new(params) }

      it 'has property tactic_ids' do
        expect(described_class.properties).to include :tactic_ids
      end

      it 'has property channel' do
        expect(described_class.properties).to include :channel
      end

      it 'has property sends' do
        expect(described_class.properties).to include :sends
      end

      it 'has property opens' do
        expect(described_class.properties).to include :opens
      end

      it 'has property clicks' do
        expect(described_class.properties).to include :clicks
      end

      it 'has property delivered' do
        expect(described_class.properties).to include :delivered
      end

      it 'has property bounced' do
        expect(described_class.properties).to include :bounced
      end

      it 'has property unsubscribed' do
        expect(described_class.properties).to include :unsubscribed
      end

      it 'has property marked_spam' do
        expect(described_class.properties).to include :marked_spam
      end
    end
  end
end
