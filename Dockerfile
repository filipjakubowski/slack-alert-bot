FROM ruby:slim
RUN apt-get update -qq && apt-get install -y build-essential
ARG ASSET_HOST
RUN mkdir /slack-alert-bot
WORKDIR /slack-alert-bot
ADD Gemfile /slack-alert-bot/Gemfile
ADD Gemfile.lock /slack-alert-bot/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /slack-alert-bot

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
EXPOSE 3000
CMD ["foreman","start"]
