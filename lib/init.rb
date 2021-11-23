require './lib/calculate'
require './lib/exceptions'

class Init
  attr_accessor :temperature_value, :scale_from, :scale_to

  def main_menu
    puts "\tPrint \"q\" to exit\n"

    value = take_temperature
    return value if exit?(value)

    value = take_scale_from
    return value if exit?(value)

    value = take_scale_to
    return value if exit?(value)
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
    except = Except.new
    loop do
      puts 'Enter temperature: '
      @value = gets.chomp
      return @value if exit?(@value)
      break if except.number?(@value)

      puts "\t***Temperature is not correct, try again (must be a number)***"
    end

    @temperature_value = @value
  end

  def take_scale_from
    except = Except.new
    loop do
      puts 'Enter scale type from (C, K, F): '
      @value = gets.chomp
      return @value if exit?(@value)
      break if except.scale?(@value)

      puts "\t***Scale type \"from\" is not correct, try again (must be a single character C, K, F)***"
    end

    @scale_from = @value
  end

  def take_scale_to
    except = Except.new
    loop do
      puts 'Enter scale type to (C, K, F): '
      @value = gets.chomp
      return @value if exit?(@value)
      break if except.scale?(@value)

      puts "\t***Scale type \"to\" is not correct, try again (must be a single character C, K, F)***"
    end

    @scale_to = @value
  end
end
