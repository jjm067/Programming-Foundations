  def prompt(message)
    Kernel.puts("=> #{message}")
  end

  def valid_number?(num)
    num.to_i() != 0 && num.to_i() > 0
  end

  def integer?(input)
    input.to_i.to_s == input
  end

  prompt("Welcome to Mortgage Caculator! Please enter your name:")
  name = ''
  loop do
    name = Kernel.gets().chomp()

    if name.empty?()
      prompt("Make sure to use a valid name.")
    else
      break
    end
  end

  prompt("Hello #{name}.")

  loop do
    loan_amount = ''
    loop do
      prompt("Please enter the total loan amount in dollars:")
      loan_amount = Kernel.gets().chomp()

      if valid_number?(loan_amount)
        break
      elsif integer?(loan_amount)
        prompt("Please enter an amount above $0.")
      else
        prompt("Hmm... that doesn't look like a  valid number")
      end
    end

    loan_duration = ''
    loop do
      prompt("Please enter the duration of the loan in years:")
      loan_duration = Kernel.gets().chomp()

      if valid_number?(loan_duration)
        break
      elsif integer?(loan_duration)
        prompt("Please enter a duration above 0 years.")
      else
        prompt("Hmm... that doesn't look like a  valid number")
      end
    end

    yearly_interest = ''
    loop do
      prompt("What is the yearly interest rate? Please enter a number without the '%'")
      yearly_interest = Kernel.gets().chomp()

      if valid_number?(yearly_interest)
        break
      elsif integer?(yearly_interest)
        prompt("Please enter a rate above 0%.")
      else
        prompt("Hmm... that doesn't look like a  valid number")
      end
    end

    loan_time = (-1 * loan_duration.to_i) * 12
    monthly_interest = yearly_interest.to_f / 100 / 12
    part1 = monthly_interest.to_f * loan_amount.to_i
    part2 = 1 - (1 + monthly_interest.to_f) ** loan_time.to_i
    monthly_payment = part1.to_f / part2.to_f

    puts "Your monthly payment will be $#{monthly_payment.to_i}."

    prompt("Do you want to find out another mortgage payment? (Y to calculate again)")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  end

  prompt("Thank you for using the Mortgage Calculator. Good bye!")