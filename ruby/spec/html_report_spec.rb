require 'machine'
require 'robot'
require 'html_report'
require 'stringio'
require 'productionline'
require 'standardreportformatter'

describe HtmlReport do
  it 'should report the state of everything' do
    line = []
    line << Machine.new("mixer", "left")

    extruder = Machine.new("extruder", "center")
    extruder.put("paste")
    line << extruder

    oven = Machine.new("oven", "right")
    oven.put("chips")
    line << oven

    robot = Robot.new
    robot.move_to(extruder)
    robot.pick
    report = HtmlReport.new(ProductionLine.new(line), robot, StandardReportFormatter.new)

    expected = <<END_OF_EXPECTED
<h1>FACTORY REPORT</h1>
<ul>
<li>Machine mixer</li>
<li>Machine extruder</li>
<li>Machine oven bin=chips</li>
</ul>
<p>Robot location=extruder bin=paste</p>
<hr>
END_OF_EXPECTED
    report.to_s.should == expected
  end
end


