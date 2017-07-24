FROM ruby:2.4.1
RUN gem install sinatra --no-document
RUN apt-get update -qq && apt-get install -y build-essential
ARG ASSET_HOST
ENV APP_PATH /slack-alert-bot

RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH
ADD Gemfile $APP_PATH/Gemfile
ADD Gemfile.lock $APP_PATH/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . $APP_PATH

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
EXPOSE 3000
# CMD ruby $APP_PATH/app/bot.rb -o 0.0.0.0
CMD bundle exec rackup -p 3000
