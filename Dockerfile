# Force a recent version of bundler
FROM ruby:2.6.5

RUN gem install bundler

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]