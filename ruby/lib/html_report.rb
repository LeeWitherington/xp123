class HtmlReport
  def initialize(production_line, robot, report_formatter)
    @out = StringIO.new
    @production_line = production_line
    @robot = robot
    report_formatter.format self
  end

  def print_header
    @out.print("<h1>FACTORY REPORT</h1>\n")
  end

  def print_machines
    @out.print("<ul>\n")
    @production_line.print_machines self
    @out.print("</ul>\n")
  end

  def print_robot
    @out.print("<p>")
    @out.print "Robot"
    @robot.print_location self
    @robot.print_bin self
    @out.print("</p>\n")
  end

  def print_footer
    @out.print("<hr>\n")
  end

  def print_machine machine
    @out.print("<li>")
    @out.print "Machine #{machine.name}"
    @out.print " bin=#{machine.bin}" if machine.bin != nil
    @out.print("</li>\n")
  end

  def print_location location
    @out.print " location=#{location.name}"
  end

  def print_bin bin
    @out.print " bin=#{bin}"
  end

  def to_s
    @out.string
  end
end

