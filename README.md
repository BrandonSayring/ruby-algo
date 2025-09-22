# Technical Exercise

Write best practice code in ruby to calculate the check digit of an ISBN-13 barcode.

The algorithm is:

1. Take each digit, from left to right and multiply them alternatively by 1 and 3
2. Sum those numbers
3. Take mod 10 of the summed figure
4. Subtract 10 and if the end number is 10, make it 0

<br/>

Example for `978014300723`:

1. (9×1) + (7×3) + (8×1) + (0×3) + (1×1) + (4×3) + (3×1) + (0×3) + (0×1) + (7×3) + (2×1) + (3×3)
2. 86
3. 86 mod 10 = 6
4. 10 - 6 = 4

Therefore the complete ISBN is: `9780143007234`

<br/>
<br/>

# Solution

The function to calculate the ISBN-13 check digit is located in the `calculate_check_digit.rb` file.

## Requirements

Usage and testing requires to at least have Ruby installed.

Run the following command in the terminal to check if Ruby is already installed otherwise download it [here](https://www.ruby-lang.org/en/downloads/).

```sh
ruby -v
```

<br/>

`Rakefile` contains tasks to run tests and requires the `rake` gem to be installed.

To check if `rake` is installed run:

```sh
rake --version
```

If `rake` is not installed, run:

```sh
gem install rake
```

<br/>

## Usage

**_Important:_** `validation.rb` is a required dependency to use `calculate_check_digit`.

```ruby
# new_file.rb
require_relative "calculate_check_digit"

isbn_prefix = "979-11-86178-14"

puts calculate_check_digit(isbn_prefix) # => 9791186178140
```

<br/>

## Testing the algorithm

### Test any ISBN-13 number

To calculate the check digit of any ISBN-13 number, run the `test:input` rake task in the terminal:

```sh
cd path/to/project
rake test:input
```

**_NOTE:_** Alternatively, run `ruby tests/test_input.rb` in the terminal to run the same test without `rake` gem installed.

<br/>

Follow the instruction to enter the first 12 digits of a valid ISBN-13 number and the coresponding check digit will be generated.

Hyphenated numbers are accepted but the `calculate_check_digit` function returns the complete ISBN-13 number unformatted.

<br/>

### Test validation

`validation.rb` contains validation checks for the following:

1. Input only contains integers.
2. Input is exactly 12 digits.
3. ISBN-13 number must begin with either **978** or **979** prefixes.
4. Input uses allocated ISBN-13 Registration Groups listed [here](https://en.wikipedia.org/wiki/List_of_ISBN_registration_groups).

<br/>

Test validation by running `test:validation` rake task in the terminal to show expected outputs for valid and invalid inputs.

```sh
rake test:validation
```

**_NOTE:_** Alternatively, run `ruby tests/test_validation.rb` in the terminal to run the same test without `rake` gem installed.
