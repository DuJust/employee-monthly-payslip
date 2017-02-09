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
    case annual_salary.to_i
      when 0..18200 then
        base     = 0
        boundary = 0
        rate     = 0
      when 18201..37000 then
        base     = 0
        boundary = 18200
        rate     = 0.19
      when 37001..80000 then
        base     = 3572
        boundary = 37000
        rate     = 0.325
      when 80001..180000 then
        base     = 17547
        boundary = 80000
        rate     = 0.37
      when 180001..Float::INFINITY then
        base     = 54547
        boundary = 180000
        rate     = 0.45
    end
    tax(base, boundary, rate)
  end

  def net_income
  end

  def super_income
  end

  private

  def tax(base, boundary, rate)
    ((base + (BigDecimal.new(annual_salary) - boundary) * rate) / 12).round
  end
end
