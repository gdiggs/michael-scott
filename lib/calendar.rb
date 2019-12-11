require "forwardable"
require "icalendar"

class Calendar
  extend Forwardable

  DEFAULT_YEARS_TO_ADD = 3

  def initialize(years_to_add = DEFAULT_YEARS_TO_ADD)
    @calendar = Icalendar::Calendar.new
    current_year = Time.now.year
    @year_range = (current_year...current_year+years_to_add)
  end

  def create_events(summary, month, day)
    year_range.each do |year|
      create_event(summary, year, month, day)
    end
  end

  def_delegators :calendar, :events, :to_ical

  private

  attr_reader :calendar, :year_range

  def create_event(summary, year, month, day)
    event_date = Icalendar::Values::Date.new(format_date(year, month, day))
    event = Icalendar::Event.new
    event.dtstart = event_date
    event.dtend = Icalendar::Values::Date.new(event_date.value + 1)
    event.summary = summary
    event.x_microsoft_cdo_busystatus = "FREE"
    calendar.add_event(event)
  end

  def format_date(year, month, day)
    fmt = "%02d"
    "#{year}#{fmt % month}#{fmt % day}"
  end
end
