class Calculate
  attr_accessor :temperature_value
  attr_reader :scale

  def initialize(temperature_value, scale)
    @temperature_value = temperature_value.to_f
    @scale = scale
  end

  def convert_to_c
    @temperature_value -= 273.15 if @scale[/^[Kk]$/]
    @temperature_value = (5.0 / 9.0) * (@temperature_value - 32) if @scale[/^[Ff]$/]
    @temperature_value = @temperature_value.round(2)
  end

  def convert_to_f
    @temperature_value = ((9.0 / 5.0) * @temperature_value) + 32 if @scale[/^[Cc]$/]
    @temperature_value = ((9.0 / 5.0) * (@temperature_value - 273.15)) + 32 if @scale[/^[Kk]$/]
    @temperature_value = @temperature_value.round(2)
  end

  def convert_to_k
    @temperature_value += 273.15 if @scale[/^[Cc]$/]
    @temperature_value = ((5.0 / 9.0) * (@temperature_value - 32)) + 273.15 if @scale[/^[Ff]$/]
    @temperature_value = @temperature_value.round(2)
  end
end
