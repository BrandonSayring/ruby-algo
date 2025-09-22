require_relative "validation"

def calculate_check_digit(isbn_number)
  checksum = 0

  # Convert isbn_number to string class so that we can loop through each digit.
  # Remove hyphens if they exist.
  # Remove any spaces
  isbn_number = isbn_number.to_s.delete("-").delete(" ")

  # Validate isbn_number and return early if not a valid ISBN-13 number.
  if !validate?(isbn_number)
    return nil
  end

  # We need to keep track of the index of each digit so that we know whether to multiply it by 3
  isbn_number.each_char.with_index do |digit, index|
    # Convert digit at current index to integer so we can perform math operations 
    digit = digit.to_i

    # Check if current index is an even or number
    if index % 2 == 0
      # If even (or 0), add it to the checksum variable
      checksum += digit
    else
      # If odd, multiply it by 3 and add it to the checksum variable
      checksum += digit * 3
    end
  end

  # Calculate mod 10 of the checksum variable
  checksum = checksum % 10

  # If greater than 0, subtract checksum from 10
  if checksum > 0
    checksum = 10 - checksum
  end

  # Convert checksum to string and append to the end of isbn_number
  result = isbn_number + checksum.to_s
  return result
end