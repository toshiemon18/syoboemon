# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'syoboemon/version'

Gem::Specification.new do |spec|
  spec.name          = "syoboemon"
  spec.version       = Syoboemon::VERSION
  spec.authors       = ["toshiemon18"]
  spec.email         = ["st12318@gmail.com"]

  spec.summary       = %q{shoboi calendar API wrapper.}
  spec.description   = %q{しょぼいカレンダーのAPIﾗｯﾊﾟｯﾊﾟ. 他の人も作ってたけど自分が欲しい情報引っ張ってくる機能が無かったので自力で実装してる.}
  spec.homepage      = "https://github.toshiemon18"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "happyapper"
  spec.add_runtime_dependency "faraday", "~> 0.9.1"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
