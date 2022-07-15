FROM ruby:3.0-alpine3.16

COPY Gemfile Gemfile.lock quickstart.rb mosdns-cn.rb /code/

ENV  TZ=Asia/Shanghai

WORKDIR /code
RUN bundle install

CMD ["ruby", "quickstart.rb"]