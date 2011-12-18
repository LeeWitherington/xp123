require 'report'

class HtmlReport < ReportBase
  def initialize(production_line, robot)
    super(production_line, robot)
  end

  def print_header
    @out.print("<h1>FACTORY REPORT</h1>\n")
  end

  def print_machines production_line
    @out.print("<ul>\n")
    production_line.print_machines self
    @out.print("</ul>\n")
  end

  def print_robot robot
    @out.print("<p>")
    @out.print "Robot"
    robot.print_location self
    robot.print_bin self
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
end

