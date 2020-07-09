FROM ruby:2.7.1-buster

# RUN bundle install
ADD Gemfile /tmp
RUN cd /tmp &&\
    bundle install
