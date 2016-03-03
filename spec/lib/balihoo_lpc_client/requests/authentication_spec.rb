require 'spec_helper'

module BalihooLpcClient
  module Requests
    describe Authentication do
      let(:config) { Configuration.new }
      let(:connection) { Connection.new(config: config) }

      subject { Authentication.new(connection: connection) }

      describe '.initialize' do
        it 'sets connection for class' do
          expect(subject.connection).to eq connection
        end

        it 'set class base_uri' do
          expect(subject.class.base_uri).to eq config.url
        end
      end

      describe '.authenticate!' do
        it 'calls api endpoint genClientAPIKey' do
          expect(Authentication).to receive(:post).with('genClientAPIKey')
          subject.authenticate!
        end
      end
    end
  end
end
