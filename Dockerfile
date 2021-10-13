FROM ruby:2.5
EXPOSE 80
COPY http_server.rb .
CMD ruby http_server.rb
