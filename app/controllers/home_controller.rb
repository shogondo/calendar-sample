class HomeController < ApplicationController
  def show()
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    @calendar_options = {
      start_day: :sunday,
      extra_day_classse: lambda { |classes, date| 
        classes << "cal-day-daylight" if (5 == date.day)
        classes << "cal-day-night" if (10 == date.day)
      }
    }
  end
end
