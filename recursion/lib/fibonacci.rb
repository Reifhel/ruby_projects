module Fibonacci 
  def fib_recursive(num)
    seq = Array.new
    return [0] if num <= 1
    return [0, 1] if num == 2
    seq = fib_recursive(num - 1)
    seq << seq[-2] + seq[-1]
    return seq
  end

  def fib_iteration(num)
    i = 1
    j = 0
    seq = Array.new
    1.upto(num) do
      t = i + j
      i = j
      j = t
      seq << i
    end
    return seq
  end
end