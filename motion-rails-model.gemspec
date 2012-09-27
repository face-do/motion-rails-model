# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-rails-model/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["face-do"]
  gem.email         = ["face.do.123@gmail.com"]
  gem.description   = %q{likes rails model}
  gem.summary       = %q{likes rails model}
  gem.homepage      = "https://github.com/face-do"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion-rails-model"
  gem.require_paths = ["lib"]
  gem.version       = RM::Model::VERSION

  gem.add_dependency "bubble-wrap", "~>1.1.4"

end
