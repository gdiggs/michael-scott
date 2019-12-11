# Michael Scott

This ruby script will generate an [iCalendar](https://icalendar.org) file of team birthdays and work anniversaries, to be imported to your work calendar.

## Usage

First, fill out a `data.yml` file in the following format:

```yaml
anniversaries:
  Jim Halpert: "1999-02-02"
  Creed Bratton: "1969-07-04"
birthdays:
  Dwight Schrute: "01-20"
  Meredith Palmer: "05-12"
```

Then, run the script `./run data.yml > team_events.ical` and import it into your calendar
