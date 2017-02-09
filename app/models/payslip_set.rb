require 'csv'

class PayslipSet
  ROW_INDICES = {
    'first_name'         => 0,
    'last_name'          => 1,
    'annual_salary'      => 2,
    'super_rate'         => 3,
    'payment_start_date' => 4,
  }

  def initialize(file_path)
    @csv_file = CSV.read(file_path, headers: true)
  end

  def payslips
    @payslips ||= @csv_file.map do |row|
      payslip = Payslip.new
      ROW_INDICES.each { |key, value| payslip.send("#{key}=", row[value]) }
      payslip
    end
  end
end
