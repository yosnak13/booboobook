FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install
COPY . /app
# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets && \
  mkdir -p /tmp/public && \
  cp -rf /app/public/* /tmp/public
