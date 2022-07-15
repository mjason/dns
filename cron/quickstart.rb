require 'rubygems'
require 'bundler/setup'
require 'rufus-scheduler'
require_relative './mosdns-cn'


scheduler = Rufus::Scheduler.singleton

scheduler.in '30s' do
  runner()
end

scheduler.every '6h' do
  runner()
end

scheduler.join
