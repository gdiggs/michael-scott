require "yaml"

class EventData
  def self.from_yaml(filename)
    data = YAML.load_file(filename)
    new(data)
  end

  def initialize(data)
    @data = data
  end

  def events
    anniversaries + birthdays
  end

  private

  attr_reader :data

  def anniversaries
    @anniversaries ||=
      data.fetch("anniversaries", []).map do |name, date|
        date = Date.parse(date)
        {
          date: date,
          name: "#{name} Work Anniversary (#{date.year})",
        }
      end
  end

  def birthdays
    @birthdays ||=
      data.fetch("birthdays", []).map do |name, date|
        date = Date.strptime(date, "%m-%d")
        {
          date: date,
          name: "#{name} Birthday",
        }
      end
  end
end
