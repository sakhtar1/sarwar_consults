
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sarwar_consults/version"

Gem::Specification.new do |spec|
  spec.name          = "sarwar_consults"
  spec.version       = SarwarConsults::VERSION
  spec.authors       = ["'Sharmina Akhtar'"]
  spec.email         = ["'sakht318@gmail.com'"]

  spec.summary       = %q{Sarwar Consults}
  spec.description   = %q{Provide consultancy advice via Sarwar Consults website, a consultancy agency}
  spec.homepage      = "https://github.com/sakhtar1/sarwar_consults"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/sarwar_consults"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"

end
