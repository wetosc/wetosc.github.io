FROM debian:12-slim

WORKDIR /app

RUN apt-get update && apt-get install ruby-full build-essential -y

RUN gem install bundler jekyll