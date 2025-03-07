require 'spec_helper'
require_relative '../detect_substrings.rb'

RSpec.describe 'Project: Sub Strings' do

  describe 'Get the substrings from a text in a dictionary' do

    it 'For a single word' do
      dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
      result = { "below" => 1, "low" => 1 }
      expect(substrings("below", dictionary)).to eq(result)
    end

    it 'For multiple words' do
      dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
      text = "Howdy partner, sit down! How's it going?"
      result = { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
      expect(substrings(text, dictionary)).to eq(result)
    end
  end

end
