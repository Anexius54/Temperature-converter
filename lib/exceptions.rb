class Except
  def number?(value)
    return false unless value[/^?[0-9]+$/]

    true
  end

  def scale?(value)
    return false unless value[/^?[CcFfKk]$/]

    return false if value.length > 1

    true
  end
end
