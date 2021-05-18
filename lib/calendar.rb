require "forwardable"
require "icalendar"

class Calendar
  extend Forwardable

  def initialize
    @calendar = Icalendar::Calendar.new
    current_year = Time.now.year
  end

  def create_events(summary, month, day)
    create_event(summary, Time.now.year, month, day)
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
    event.rrule = "FREQ=YEARLY"
    calendar.add_event(event)
  end

  def format_date(year, month, day)
    fmt = "%02d"
    "#{year}#{fmt % month}#{fmt % day}"
  end
end
