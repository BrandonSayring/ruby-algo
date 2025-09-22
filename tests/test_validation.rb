require 'minitest/autorun'
require_relative "../calculate_check_digit"


class TestValidInputs < Minitest::Test
  def test_valid_prefix_978
    puts "\nInput valid"
    puts "Input: 978-94-6265-011"
    puts "Output: #{calculate_check_digit("978-94-6265-011")}\n"
    assert_equal "9789462650114", calculate_check_digit("978-94-6265-011")
  end
  
  def test_valid_prefix_979
    puts "\nInput valid"
    puts "Input: 979-10-90636-07"
    puts "Output: #{calculate_check_digit("979-10-90636-07")}\n"
    assert_equal "9791090636071", calculate_check_digit("979-10-90636-07")
  end
end

class TestInvalidInputs < Minitest::Test
  def test_input_empty
    assert_nil calculate_check_digit("")
  end

  def test_invalid_characters
    assert_nil calculate_check_digit("abc!@#$%^&*")
  end

  def test_invalid_length_short
    assert_nil calculate_check_digit("123")
  end

  def test_invalid_length_long
    assert_nil calculate_check_digit("123123123123123456")
  end

  def test_invalid_prefix
    assert_nil calculate_check_digit("123-123-123-123")
  end

  def test_invalid_registration_group_reserved
    assert_nil calculate_check_digit("979-04-6265-011")
  end

  def test_invalid_registration_group_unallocated_single_digit
    assert_nil calculate_check_digit("979-9-46265-011")
  end

  def test_invalid_registration_group_unallocated_double_digit
    assert_nil calculate_check_digit("979-15-6265-011")
  end
end