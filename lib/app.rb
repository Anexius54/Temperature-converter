require './lib/init'

class App
  def run
    init = Init.new
    loop do
      value = init.main_menu
      return if init.exit?(value)

      puts "Result: #{init.convert}#{init.scale_to.upcase} \n\n"
    end
  end
end
