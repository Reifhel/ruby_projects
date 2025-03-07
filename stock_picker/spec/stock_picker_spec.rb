require 'spec_helper'
require_relative '../stock_picker.rb'

RSpec.describe 'Project: Stock Picker' do

  describe 'Get the best day to bbuy and sell' do

    it 'Example project odin' do
      array = [17,3,6,9,15,8,6,1,10]
      result = [1,4]
      expect(stock_picker(array)).to eq(result)
    end

  end

end