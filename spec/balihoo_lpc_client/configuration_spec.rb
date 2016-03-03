require 'spec_helper'

module BalihooLpcClient
  describe Configuration do
    describe ".api_url" do
      it "defaults to https://bac.dev.balihoo-connect.com" do
        expect(subject.api_url).to eq "https://bac.dev.balihoo-connect.com"
      end
    end
  end
end
