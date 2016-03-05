# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'balihoo_lpc_client/version'

Gem::Specification.new do |spec|
  spec.name          = "balihoo_lpc_client"
  spec.version       = BalihooLpcClient::VERSION
  spec.authors       = ["JD Guzman", "Nic Boie"]
  spec.email         = ["jd.guzman@bluewaterbrand.com", "nic.boie@bluewaterbrand.com"]

  spec.summary       = %q{Ruby Client for Balihoo's LPC API}
  spec.description   = %q{Ruby Client for Balihoo's LPC API}
  spec.homepage      = "https://github.com/riverock/balihoo_lpc"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_dependency "hashie"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "webmock"
end
