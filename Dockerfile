FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN apt-get install -y nodejs nodejs-legacy

RUN mkdir -p /var/app
COPY Gemfile /var/app/Gemfile
COPY Gemfile.lock /var/app/Gemfile.lock
WORKDIR /var/app
RUN bundle install
CMD bundle exec rails s -b 0.0.0.0 
