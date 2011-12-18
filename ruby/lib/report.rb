class ReportBase
  def initialize production_line, robot
    @out = StringIO.new
    print_header
    print_machines production_line
    print_robot robot
    print_footer
  end

  def to_s
    @out.string
  end

  def print_location location
    @out.print " location=#{location.name}"
  end

  def print_bin bin
    @out.print " bin=#{bin}"
  end
end

class Report < ReportBase
  def initialize(production_line, robot)
    super(production_line, robot)
  end

  def print_header
    @out.print "FACTORY REPORT\n"
  end

  def print_machines production_line
    production_line.print_machines self
    print_newline
  end

  def print_robot robot
    @out.print "Robot"
    robot.print_location self
    robot.print_bin self
    print_newline
  end

  def print_machine machine
    @out.print "Machine #{machine.name}"
    @out.print " bin=#{machine.bin}" if machine.bin != nil
    @out.print "\n"
  end

  def print_footer
    @out.print "========\n"
  end

  def print_newline
    @out.print "\n"
  end


end