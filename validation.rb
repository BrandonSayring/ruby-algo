def error_message(string)
  return "\n\e[31mInput invalid \n\e[3m#{string}\e[0m \n\n"
end
def bold(string)
  return "\e[1m#{string}\e[22m"
end

def only_contains_numbers?(input_string)
  input_string.match?(/\A\d+\z/)
end

def invalid_prefix?(input)
  get_prefix = input[0, 3]

  if get_prefix == "978"
    return false
  elsif get_prefix == "979"
    return false
  else
    return true
  end
end

def registration_group_error(input)
  return "#{input[0, 3] + bold(input[3]) + input[4..-1]} \nRegistration group #{bold(input[3])}"
end
def invalid_registration_group?(input)
  # Check if registration group is reserved or unallocated.
  prefix = input[0, 3]
  single_digit = input[3]
  unallocated_range_single = (2..7)
  double_digit = input[3, 2]
  unallocated_range_double = (14..19)

  if prefix == "979"
    if single_digit == "0"
      warn error_message("#{registration_group_error(input)} reserved for ISMN numbers.")
      return true
    elsif unallocated_range_single.include?(single_digit.to_i)
      warn error_message("#{registration_group_error(input)} unallocated, shared with ISMN numbers.")
      return true
    elsif single_digit == "9"
      warn error_message("#{registration_group_error(input)} unallocated, shared with ISMN numbers.")
      return true
    elsif unallocated_range_double.include?(double_digit.to_i)
      warn error_message("#{prefix + bold(double_digit) + input[5..-1]} \nRegistration group #{bold(double_digit)} unallocated, shared with ISMN numbers.")
      return true
    end
  else
    return false
  end
end

def validate?(input)
  if input.length == 0
    warn error_message("Input empty. Calculating ISBN-13 check digit requires 12 digits.")
    return false
  elsif !only_contains_numbers?(input)
    warn error_message("#{bold(input)} \nContains characters not accepted in ISBN-13 numbers.")
    return false
  elsif input.length > 12
    warn error_message("#{input[0, 12]  + bold(input[12..-1])} \nContains #{input.length - 12} too many digits. Calculating ISBN-13 check digit requires 12 digits.")
    return false
  elsif input.length < 12
    warn error_message("#{bold(input)} \nContains only #{input.length} digits. Calculating ISBN-13 check digit requires 12 digits.")
    return false
  elsif invalid_prefix?(input)
    warn error_message("#{bold(input[0,3]) + input[3..-1]} \nPrefix of #{input[0, 3]} not accepted. ISBN-13 number must begin with #{bold("978")} or #{bold("979")}.")
    return false
  elsif invalid_registration_group?(input)
    return false
  else
    return true
  end
end