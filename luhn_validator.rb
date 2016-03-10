module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    checksum = nums_a[-1]
    arr_len = nums_a.size
    sum = 0 #ini sum
    # puts "there are #{arr_len} numbers"
    # puts nums_a
    for i in 1..arr_len
      if i != 1#skip last number
        tmp = nums_a["-#{i}".to_i]
          if i%2 == 0 then
            sum += dig_sum(tmp)
          else
            sum += tmp
          end
       end
    end

    # puts "checksum is #{checksum}"
    # puts "calculate result is #{sum}"
    return sum*9%10 == checksum
end

  #multiply 2 and return digit sum
  def dig_sum(numberOfEvenIndex)
    # puts "input is #{numberOfEvenIndex}"
    result = (numberOfEvenIndex*2).to_s.chars.map(&:to_i).inject(:+)
    # puts "output is #{result}"
    return result
  end
end
