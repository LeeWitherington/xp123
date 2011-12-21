class Report
  def initialize(production_line, robot, report_formatter)
    @out = StringIO.new
    @production_line = production_line
    @robot = robot
    report_formatter.format self
  end

  def print_header
    @out.print "FACTORY REPORT\n"
  end

  def print_machines
    @production_line.print_machines self
    print_newline
  end

  def print_robot
    @out.print "Robot"
    @robot.print_location self
    @robot.print_bin self
    print_newline
  end

  def print_machine machine
    @out.print "Machine #{machine.name}"
    @out.print " bin=#{machine.bin}" if machine.bin != nil
    @out.print "\n"
  end

  def print_location location
    @out.print " location=#{location.name}"
  end

  def print_bin bin
    @out.print " bin=#{bin}"
  end

  def print_footer
    @out.print "========\n"
  end

  def print_newline
    @out.print "\n"
  end

  def to_s
    @out.string
  end
end