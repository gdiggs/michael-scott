FROM ruby:2.6-slim

WORKDIR /app

COPY Gemfile* ./
RUN bundle install --jobs "$(nproc)"

COPY . .

ENTRYPOINT ["/app/run"]
