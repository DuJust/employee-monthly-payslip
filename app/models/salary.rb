class Salary
  MONTHS_OF_YEAR = 12
  PERCENT = 100

  attr_accessor :annual_salary, :super_rate

  def initialize(annual_salary, super_rate)
    @annual_salary = annual_salary
    @super_rate    = super_rate
  end

  def gross_income
    (@annual_salary / MONTHS_OF_YEAR).round
  end

  def income_tax
    TaxCalculator.new(@annual_salary).execute
  end

  def net_income
    gross_income - income_tax
  end

  def super_income
    (gross_income * (@super_rate / PERCENT)).round
  end
end
