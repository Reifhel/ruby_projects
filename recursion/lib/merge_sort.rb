module MergeSorter
  def merge_sort(array)
    # base case
    return array if array.length < 2

    divide = array.length / 2

    left_half = merge_sort(array[0...divide])
    right_half = merge_sort(array[divide..array.length])

    sorted = []
    until left_half.empty? || right_half.empty?
      left_half.first <= right_half.first ? sorted << left_half.shift : sorted << right_half.shift
    end

    return sorted + left_half + right_half
  end
end