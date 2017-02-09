class PayslipValidator < ActiveModel::Validator
  def validate(record)
    unless valid_positive_integer?(record.annual_salary)
      record.errors.add :annual_salary, "\'#{record.annual_salary}\' is not a valid number."
    end
    unless valid_percentage?(record.super_rate)
      record.errors.add :super_rate, "\'#{record.super_rate}\' is not a valid percentage."
    end
    unless valid_date_range?(record.payment_start_date)
      record.errors.add :payment_start_date, "\'#{record.payment_start_date}\' is not a valid date range."
    end
  end

  private

  def valid_positive_integer?(str)
    /^\d+$/.match(str)
  end

  def valid_percentage?(str)
    number = BigDecimal.new(str)
    /^\d+(\.\d*)?%$/.match(str) && number >= 0 && number <= 50
  end

  def valid_date_range?(str)
    dates = str.split('-')
    dates.length == 2 && dates.all? { |date_str| valid_date?(date_str) } && dates.first.to_date < dates.last.to_date
  end

  def valid_date?(date_str)
    date_str.to_date rescue false
  end
end
