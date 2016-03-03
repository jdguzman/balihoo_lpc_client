require 'simplecov'
SimpleCov.start do
  add_group 'Libraries', 'lib'
  add_filter "/spec/"
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'balihoo_lpc_client'
