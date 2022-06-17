# Calculator

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation
# output the result

require 'yaml'
MESSAGES = YAML.load_file('car_calc.yml')

def prompt(message)
  Kernel.puts"=> #{message}"
end
 

prompt(MESSAGES['welcome'])

name = ''
loop do # name loop
    name = Kernel.gets.chomp

    if name.empty?
      prompt(MESSAGES['valid_name'])
    else
      break
    end
end

prompt("Hi #{name}!")

loop do # main loop
  
  loan_amount = ''
  loop do # obtains loan amount
    prompt(MESSAGES['loan_amount'])
    loan_amount = Kernel.gets.chomp

    if loan_amount.empty? || loan_amount.to_f < 0
      prompt(MESSAGES['invalid_number'])
    else
      break
    end
  end

  loan_duration_months = ''
  loop do # obtains lease length
    prompt(MESSAGES['loan_months'])
    loan_duration_months = Kernel.gets.chomp

    if loan_duration_months.empty? || loan_duration_months.to_i < 0
      prompt(MESSAGES['invalid_number'])
    else
      break
    end
  end

  interest_rate = ''
  loop do # obtains interest %
    prompt(MESSAGES['interest'])
    interest_rate = gets.chomp

    if interest_rate.empty? || interest_rate.to_f < 0
      prompt(MESSAGES['invalid_number'])
    else
      break
    end
  end
  
  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  

  monthly_payment = loan_amount.to_f * 
                    (monthly_interest_rate / 
                    (1 - (1 + monthly_interest_rate)**(-loan_duration_months.to_i)))

  prompt"The monthly payment is: $#{format('%.2f', monthly_payment)}"
  prompt(MESSAGES['again?'])
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end
 
prompt(MESSAGES['exit'])