class Numeric

  def decade
    (self / 10) * 10
  end

  def next_decade
    decade + 10
  end

  def prev_decade
    self == decade ? decade - 10 : decade
  end

  def decadeup(to)
    d = decade
    ary = []
    while d <= to.decade
      d = d.next_decade
      ary << d
    end

    if block_given?
      ary.each {|d| yield d}
      self
    else
      ary.to_enum
    end
  end

  def decadedown(to)
    d = prev_decade
    ary = [d]
    while d > to
      d = d.prev_decade
      ary << d
    end

    if block_given?
      ary.each {|d| yield d}
      self
    else
      ary.to_enum
    end
  end

end
