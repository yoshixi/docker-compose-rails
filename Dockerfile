FROM ruby:alpine

RUN apk add --update build-base postgresql-dev tzdata
# build-base contains the necessary tools for compiling things from source. since gems like nokogiri
RUN gem install rails -v '5.2'

# run bundle install at local and generate Gemfile, Gemfile.lock. add their files at docker-compose
WORKDIR /app
ADD Gemfile Gemfile.lock /app/
RUN bundle install
