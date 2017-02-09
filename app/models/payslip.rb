class Payslip
  MONTHS_OF_YEAR = 12

  attr_accessor :first_name, :last_name, :annual_salary, :super_rate, :payment_start_date

  def name
    "#{first_name} #{last_name}"
  end

  def pay_period
  end

  def gross_income
    (BigDecimal.new(annual_salary) / MONTHS_OF_YEAR).round
  end

  def income_tax
    TaxCalculator.new(annual_salary).execute
  end

  def net_income
  end

  def super_income
  end
end
