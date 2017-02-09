class Payslip
  attr_accessor :first_name, :last_name, :annual_salary, :super_rate, :payment_start_date

  def name
    "#{first_name} #{last_name}"
  end

  def pay_period
  end

  def gross_income
  end

  def income_tax
  end

  def net_income
  end

  def super_income
  end
end
