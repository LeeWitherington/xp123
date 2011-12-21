class StandardReportFormatter
  def format report
    report.print_header
    report.print_machines
    report.print_robot
    report.print_footer
  end
end