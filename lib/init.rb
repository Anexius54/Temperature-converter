require './lib/calculate'
require './lib/exceptions'

class Init
  attr_accessor :temperature_value, :scale_from, :scale_to

  def main_menu
    puts "\tPrint \"q\" to exit\n"

    except = Except.new

    loop do
      value = take_temperature
      return value if exit?(value)
      break if except.number?(value)

      puts "\t***Temperature is not correct, try again (must be a number)***"
    end

    loop do
      value = take_scale_from
      return value if exit?(value)
      break if except.scale?(value)

      puts "\t***Scale type \"from\" is not correct, try again (must be a single character C, K, F)***"
    end

    loop do
      value = take_scale_to
      return value if exit?(value)
      break if except.scale?(value)

      puts "\t***Scale type \"to\" is not correct, try again (must be a single character C, K, F)***"
    end
  end

  def exit?(value)
    value.to_s.downcase == 'q'
  end

  def convert
    @result = Calculate.new(temperature_value, scale_from)

    case @scale_to
    when 'C', 'c'
      @result.convert_to_c
    when 'K', 'k'
      @result.convert_to_k
    when 'F', 'f'
      @result.convert_to_f
    end
  end

  private

  def take_temperature
    puts 'Enter temperature: '
    @temperature_value = gets.chomp
  end

  def take_scale_from
    puts 'Enter scale type from (C, K, F): '
    @scale_from = gets.chomp
  end

  def take_scale_to
    puts 'Enter scale type to (C, K, F): '
    @scale_to = gets.chomp
  end
end
