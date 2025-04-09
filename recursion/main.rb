require_relative 'lib/fibonacci'
require_relative 'lib/merge_sort'

include Fibonacci
include MergeSorter

p fib_recursive(8)
p fib_iteration(8)

p merge_sort([3, 2, 1, 13, 8, 5, 0, 1]) # [0, 1, 1, 2, 3, 5, 8, 13]
p merge_sort([105, 79, 100, 110]) # [79, 100, 105, 110]