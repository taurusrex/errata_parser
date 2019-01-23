FROM ruby:2.5-stretch

LABEL maintainer="Markus Bucher <bucher@atix.de>" \
      description="This container provides an errata-parser for Debian and Ubuntu" \
      website="https://github.com/ATIX-AG/errata_parser"

# Install base dependencies:
RUN apt-get update && apt-get install -y \
      build-essential \
      libapt-pkg-dev

# Add and install the errata parser:
COPY . /errata_parser/
WORKDIR /errata_parser
RUN bundle install --deployment --without rubocop

# Configure and run the errata parser:
VOLUME /errata
CMD bundle exec errata_parser.rb \
      --config /errata/config.json \
      --debian /errata/ \
      --ubuntu /errata/ \
      --metadata
