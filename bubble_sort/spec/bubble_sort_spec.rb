require 'spec_helper'
require_relative '../bubble_sort.rb'

RSpec.describe 'Project: Bubble Sort' do

  describe 'Expect the method perfect sort the values' do

    it 'Mixed values' do
      array = [3,5,9,8,2,1,4,7,6]
      result = [1,2,3,4,5,6,7,8,9]
      expect(bubble_sort(array)).to eq(result)
    end

    it 'Already sorted values' do
      array = [1,2,3,4,5,6]
      result = [1,2,3,4,5,6]
      expect(bubble_sort(array)).to eq(result)
    end

    it 'Reverse values' do
      array = [20,17,15,12,11,8,6,3,1]
      result = [1,3,6,8,11,12,15,17,20]
      expect(bubble_sort(array)).to eq(result)
    end

  end

end