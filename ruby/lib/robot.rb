class Robot
  attr_reader :location, :bin

  def move_to(location)
    @location = location
  end

  def pick
    @bin = @location.take
  end

  def release
    @location.put(@bin)
    @bin = nil
  end

  def print_location report
    report.print_location @location if @location != nil
  end

  def print_bin report
    report.print_bin @bin if @bin != nil
  end
end