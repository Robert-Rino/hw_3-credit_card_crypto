# this define a LuhnValidator module.
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    sum = 0 # ini sum
    checksum = nums_a[-1]
    reverse_arr = nums_a.reverse
    r_without_first = reverse_arr.drop(1)
    r_without_first.each_with_index do |val,index|
      if (index%2) != 0
        sum += val
      else
        sum += dig_sum(val)
      end
    end
    # puts "checksum is #{checksum}"
    # puts "calculate result is #{sum}"
    sum * 9 % 10 == checksum
  end

  # multiply 2 and return digit sum
  def dig_sum(numberOfEvenIndex)
    result = (numberOfEvenIndex * 2).to_s.chars.map(&:to_i).inject(:+)
    result
  end
end
