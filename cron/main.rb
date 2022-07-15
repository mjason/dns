require 'rubygems'
require 'bundler/setup'
require 'rufus-scheduler'
require_relative './download'


scheduler = Rufus::Scheduler.singleton

logger.info("cron job running!!!")

scheduler.in '30s' do
  runner()
end

scheduler.every '6h' do
  runner()
end

scheduler.join
