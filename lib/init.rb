require './lib/calculate'
require './lib/exceptions'

class Init
  attr_accessor :temperature_value, :scale_from, :scale_to

  attr_reader :f_exit

  def initialize
    @f_exit = 'q'
  end

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

  def take_temperature
    except = Except.new
    puts 'Enter temperature: '
    value = gets.to_s.chomp
    return value if exit?(value)

    unless except.number?(value)
      puts "\t***Scale type \"from\" is not correct, try again (must be a single character C, K, F)***"
      value = @f_exit

    end

    @temperature_value = value.to_f
  end

  def take_scale_from
    except = Except.new
    puts 'Enter scale type from (C, K, F): '
    value = gets.to_s.chomp
    return value if exit?(value)

    unless except.scale?(value)
      puts "\t***Scale type \"from\" is not correct, try again (must be a single character C, K, F)***"
      value = @f_exit

    end

    @scale_from = value
  end

  def take_scale_to
    except = Except.new
    puts 'Enter scale type to (C, K, F): '
    value = gets.to_s.chomp
    return value if exit?(value)

    unless except.scale?(value)
      puts "\t***Scale type \"to\" is not correct, try again (must be a single character C, K, F)***"
      value = @f_exit

    end

    @scale_to = value
  end
end
