require_relative "../calculate_check_digit"

def test_input()
  complete_isbn13 = nil
  
  puts "Enter the \e[1mfirst 12 digits\e[0m of ISBN-13 number to calculate check digit:"

  while complete_isbn13.nil?
    user_input = gets.chomp
    # Exit test program with by entering x 
    if user_input.downcase == 'x'
      exit
    end

    complete_isbn13 = calculate_check_digit(user_input)
    if complete_isbn13.nil?
      puts "Please try again or enter 'x' to exit."
    end
  end

  # Print result
  puts "\nCheck digit is \e[1m#{complete_isbn13.chars.last}\e[0m"
  puts "\nThe complete ISBN-13 number is:"
  puts "\e[32m#{complete_isbn13}\e[0m"
end
test_input()
