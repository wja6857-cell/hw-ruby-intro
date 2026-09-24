# When done, submit this entire file to the autograder.

# Part 1

def sum(arr)
  ans = 0
  arr.each do |num|
    ans += num
  end
  ans
end

def max_2_sum(arr)
  if arr.empty?
    return 0
  elsif arr.length == 1
    return arr[0]
  end

  num1 = -Float::INFINITY
  num2 = -Float::INFINITY

  arr.each do |num|
    if num > num1
      num2 = num1
      num1 = num
    elsif num > num2
      num2 = num
    end
  end

  num1 + num2
end

def sum_to_n?(arr, n)
  h = {}

  arr.each_with_index do |num, index|
    h[num] = index
  end

  arr.each_with_index do |num, index|
    cand = n - num
    if h[cand] and h[cand] != index
      return true
    end
  end

  false
end

# Part 2

def hello(name)
  "Hello, " + name
end

def starts_with_consonant?(s)
  constants = {
    "A" => true, "E" => true, "I" => true, "O" => true, "U" => true,
    "a" => true, "e" => true, "i" => true, "o" => true, "u" => true
  }

  if s.length == 0
    return false
  end

  if s.match?(/^[a-zA-Z]/)
    if constants[s[0]]
      return false
    else
      return true
    end
  end

  false
end

def binary_multiple_of_4?(s)
  # not valid binary
  if s.match?(/[^01]/) or s.length == 0
    return false
  end

  decimal = 0
  val = 1
  s.reverse.each_char do |char|
    decimal += char.to_i * val
    val *= 2
  end

  decimal % 4 == 0
end

# Part 3

class BookInStock
  def initialize(isbn, price)
    if isbn.length == 0
      raise ArgumentError, "ISBN is an empty string"
    end

    if price <= 0
      raise ArgumentError, "Price is less than or equal to zero"
    end

    @isbn = isbn
    @price = price
  end

  def isbn
    @isbn
  end

  def price
    @price
  end

  def isbn=(arg)
    @isbn = arg
  end

  def price=(arg)
    @price = arg
  end

  def price_as_string
    "$" + format("%.2f", @price)
  end
end
