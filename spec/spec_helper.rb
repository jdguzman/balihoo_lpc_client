unless ENV['CODECLIMATE_REPO_TOKEN'].nil?
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
else
  require 'simplecov'
  SimpleCov.start do
    add_group 'Libraries', 'lib'
    add_filter "/spec/"
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'balihoo_lpc_client'
require 'webmock/rspec'
require 'pry'
