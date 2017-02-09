require 'ostruct'

class TaxCalculator
  MONTHS_OF_YEAR = 12

  GRADES = [
    OpenStruct.new(range: 0..18200, base: 0, boundary: 0, rate: 0),
    OpenStruct.new(range: 18201..37000, base: 0, boundary: 18200, rate: 0.19),
    OpenStruct.new(range: 37001..80000, base: 3572, boundary: 37000, rate: 0.325),
    OpenStruct.new(range: 80001..180000, base: 17547, boundary: 80000, rate: 0.37),
    OpenStruct.new(range: 180001..Float::INFINITY, base: 54547, boundary: 180000, rate: 0.45),
  ]

  def initialize(annual_salary)
    @annual_salary = annual_salary
  end

  def execute
    tax(GRADES.find { |grade| grade.range.cover?(@annual_salary) })
  end

  private

  def tax(grade)
    ((grade.base + (@annual_salary - grade.boundary) * grade.rate) / MONTHS_OF_YEAR).round
  end
end
