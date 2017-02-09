class CalendarMonth
  def initialize(data_string)
    @data_string           = data_string
    @begin_date, @end_date = @data_string.split('-').map(&:to_date)
  end

  def period
    end_period_date = @begin_date + distance.month - 1.day
    "#{date_format(@begin_date)} - #{date_format(end_period_date)}"
  end

  def distance
    ((@end_date + 1.day).month - @begin_date.month)
  end

  private

  def date_format(date)
    date.strftime('%d %B')
  end
end
