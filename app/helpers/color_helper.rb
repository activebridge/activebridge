module ColorHelper
  def hsl_color
    "hsl(#{@hours}, 100%, 50%)"
  end

  def hex_color
    hsl_color.paint.to_hex.gsub('#', '')
  end

  def hours_color(h)
    @hours = h

    hex_color
  end
end
