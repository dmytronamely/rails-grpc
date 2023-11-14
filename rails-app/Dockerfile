FROM ruby:3.1.4 AS builder
COPY Gemfile* .
RUN gem install grpc:1.59.2

RUN bundle install

FROM ruby:3.1.4 AS runner
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y postgresql postgresql-contrib
RUN apt-get install -y tzdata libpq-dev

WORKDIR /app
# We copy over the entire gems directory for our builder image, containing the already built artifact
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . .
# EXPOSE 3000
# CMD ["rails", "server", "-b", "0.0.0.0"]
