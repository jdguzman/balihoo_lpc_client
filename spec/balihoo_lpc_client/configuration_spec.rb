require 'spec_helper'

module BalihooLpcClient
  describe Configuration do
    describe ".api_base" do
      it "defaults to https://bac.dev.balihoo-connect.com/localdata" do
        expect(subject.api_base).to eq "https://bac.dev.balihoo-connect.com/localdata"
      end
    end

    describe ".api_version" do
      it "defaults to v1.0" do
        expect(subject.api_version).to eq "v1.0"
      end
    end

    describe ".base_url" do
      it "concats api_url and api_version" do
        expect(subject.url).to eq [subject.api_base, subject.api_version].join(?/)
      end
    end
  end
end
