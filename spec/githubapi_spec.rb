require 'spec_helper'
require 'githubapi'

describe GitHubApi do
  let(:user) { GitHubApi.new('francescoFH') }

  describe '#get_language_frequency' do
    it "calculates number of languages" do
      languages = ["JavaScript", "Ruby", "Ruby"]
      expect(user.get_language_frequency(languages)).to eq({"JavaScript" => 1, "Ruby" => 2})
    end
  end
end
