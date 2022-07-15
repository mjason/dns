FROM ruby:3.0-alpine3.16

COPY Gemfile Gemfile.lock main.rb download.rb /code/

ENV TZ=Asia/Shanghai
ENV LOGDEV=/proc/1/fd/1

WORKDIR /code
RUN bundle install

CMD ["ruby", "main.rb"]