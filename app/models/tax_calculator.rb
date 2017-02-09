class TaxCalculator
  GRADES = [
    { range: 0..18200, base: 0, boundary: 0, rate: 0 },
    { range: 18201..37000, base: 0, boundary: 18200, rate: 0.19 },
    { range: 37001..80000, base: 3572, boundary: 37000, rate: 0.325 },
    { range: 80001..180000, base: 17547, boundary: 80000, rate: 0.37 },
    { range: 180001..Float::INFINITY, base: 54547, boundary: 180000, rate: 0.45 },
  ]

  def initialize(annual_salary)
    @annual_salary = annual_salary
  end

  def execute
    grade = GRADES.find { |grade| grade[:range].cover?(@annual_salary.to_i) }
    tax(grade)
  end

  private

  def tax(grade)
    ((grade[:base] + (BigDecimal.new(@annual_salary) - grade[:boundary]) * grade[:rate]) / 12).round
  end
end
