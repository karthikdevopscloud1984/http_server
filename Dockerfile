FROM ruby:latest
WORKDIR /usr/src/app/

COPY http_server.rb /usr/src/app/

EXPOSE 80

CMD ["ruby", "/usr/src/app/http_server.rb"]
