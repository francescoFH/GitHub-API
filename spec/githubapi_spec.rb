require 'spec_helper'
require 'githubapi'

describe GitHubApi do
  let(:user) { GitHubApi.new('francescoFH') }

  describe '#calculate_favourite_language' do
    it "returns a favourite language given a Github username" do
      favourite_language = user.calculate_favourite_language
      expect(favourite_language).to eq('Ruby')
    end
  end

  describe '#get_language_frequency' do
    it "calculates number of languages" do
      languages = ["JavaScript", "Ruby", "Ruby"]
      expect(user.get_language_frequency(languages)).to eq({"JavaScript" => 1, "Ruby" => 2})
    end
  end

  describe '#sort_frequency' do
    it "sorts the languages by count" do
      frequency = {"JavaScript"=>1, "Ruby"=>2}
      expect(user.sort_frequency(frequency)).to eq([["Ruby", 2], ["JavaScript", 1]])
    end
  end

  describe '#get_favourite_language' do
    it "returns the user's favourite language" do
      result = [["Ruby", 2], ["JavaScript", 1]]
      expect(user.get_favourite_language(result)).to eq("Ruby")
    end
  end

end
