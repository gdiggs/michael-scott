require_relative "../../lib/event_data"

RSpec.describe EventData do
  describe "#events" do
    it "returns anniversaries and birthdays" do
      raw_data = {
        "anniversaries" => {
          "Jim Halpert" => "1999-02-03",
        },
        "birthdays" => {
          "Pam Beesly" => "03-25",
        },
      }
      expected_data = [
        {
          name: "Jim Halpert Work Anniversary (1999)",
          date: Date.new(1999, 2, 3),
        },
        {
          name: "Pam Beesly Birthday",
          date: Date.new(Time.now.year, 3, 25),
        },
      ]

      data = EventData.new(raw_data)

      expect(data.events).to eq(expected_data)
    end

    it "handles a lack of anniversaries and birthdays" do
      raw_data = {}
      expected_data = []

      data = EventData.new(raw_data)

      expect(data.events).to eq(expected_data)
    end
  end
end
