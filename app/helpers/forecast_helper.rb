module ForecastHelper
  require 'forecast_io'

  begin
    require 'dotenv'
    Dotenv.load
  rescue LoadError
  end

ForecastIO.api_key = ENV['FORECAST_API_KEY']

  def get_current_forecast(lat, long)
    ForecastIO.forecast(lat, long)
  end

  def current_weather(forecast)
    forecast.currently
  end

  def daily_weather(forecast)
    forecast.daily.data
  end


end
