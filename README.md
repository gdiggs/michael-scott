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

Then, run the script `./run data.yml > team_events.ics` and import it into your calendar

## Docker Usage

This script can also be run as a Docker container. You can either build it yourself or pull it from Docker Hub. To build, run:

```
docker build --rm -t gordondiggs/michael-scott .
```

And to run:

```
docker run -v "$PWD/data.yml":/tmp/data.yml gordondiggs/michael-scott /tmp/data.yml > team_events.ics
```
