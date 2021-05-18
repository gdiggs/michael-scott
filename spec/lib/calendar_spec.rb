require_relative "../../lib/calendar"

RSpec.describe Calendar do
  describe "#create_events" do
    it "creates events" do
      summary = "Dwight's Birthday"
      month = 1
      day = 20
      calendar = Calendar.new

      calendar.create_events(summary, month, day)

      expect(calendar.events.count).to eq(1)
    end

    it "creates events on the right day" do
      summary = "Dwight's Birthday"
      month = 1
      day = 20
      calendar = Calendar.new

      calendar.create_events(summary, month, day)

      expect(calendar.events.count).to eq(1)
      start_date = calendar.events.first.dtstart
      end_date = calendar.events.first.dtend

      expect(start_date.year).to eq(Time.now.year)
      expect(start_date.month).to eq(month)
      expect(start_date.day).to eq(day)
      expect(end_date.year).to eq(Time.now.year)
      expect(end_date.month).to eq(month)
      expect(end_date.day).to eq(day+1)
    end

    it "creates events with the right name" do
      summary = "Dwight's Birthday"
      month = 1
      day = 20
      calendar = Calendar.new

      calendar.create_events(summary, month, day)

      expect(calendar.events.first.summary).to eq("Dwight's Birthday")
    end
  end

  it "outputs valid ical" do
    summary = "Dwight's Birthday"
    month = 1
    day = 20
    calendar = Calendar.new

    calendar.create_events(summary, month, day)
    ical = calendar.to_ical

    expect { Icalendar::Calendar.parse(ical) }.not_to raise_error
  end
end
