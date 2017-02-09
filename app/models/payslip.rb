class Payslip
  MONTHS_OF_YEAR = 12

  attr_accessor :first_name, :last_name, :annual_salary, :super_rate, :payment_start_date

  def name
    "#{first_name} #{last_name}"
  end

  def pay_period
    begin_date, end_date = payment_start_date.split('-').map(&:to_date)
    end_period_date      = begin_date + month_distance_of_date(begin_date, end_date).month - 1.day
    "#{date_format(begin_date)} - #{date_format(end_period_date)}"
  end

  def gross_income
    (BigDecimal.new(annual_salary) / MONTHS_OF_YEAR).round
  end

  def income_tax
    TaxCalculator.new(annual_salary).execute
  end

  def net_income
    gross_income - income_tax
  end

  def super_income
    (gross_income * (super_rate.to_f / 100)).round
  end

  private

  def month_distance_of_date(begin_date, end_date)
    ((end_date + 1.day).month - begin_date.month)
  end

  def date_format(one)
    one.strftime('%d %B')
  end
end
