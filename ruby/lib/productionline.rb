class ProductionLine
  def initialize machines
    @machines = machines
  end

  def print_machines out
    @machines.each do |machine|
      out.print_machine machine
    end
  end

end