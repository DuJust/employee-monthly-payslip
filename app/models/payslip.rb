class Payslip
  attr_accessor :first_name, :last_name, :annual_salary, :super_rate, :payment_start_date

  def name
    "#{first_name} #{last_name}"
  end

  def pay_period
    calendar_month.period
  end

  def gross_income
    salary.gross_income * calendar_month.distance
  end

  def income_tax
    salary.income_tax * calendar_month.distance
  end

  def net_income
    salary.net_income * calendar_month.distance
  end

  def super_income
    salary.super_income * calendar_month.distance
  end

  private

  def salary
    @salary ||= Salary.new(annual_salary, super_rate)
  end

  def calendar_month
    @calendar_month ||= CalendarMonth.new(payment_start_date)
  end
end
