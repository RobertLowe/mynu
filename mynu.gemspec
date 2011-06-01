require 'lib/mynu/version'

Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name = %q{mynu}
  s.version = "#{Mynu::Version::STRING}"
  s.authors = ["Rob Lowe"]
  s.date = %q{2011-05-29}
  s.description = %q{A simple DSL to create a systembar menu with macruby in OSX}
  s.email = %q{rob@iblargz.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "CHANGES",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.md",
    "Rakefile",
    "mynu.gemspec",
    "lib/mynu.rb",
    "lib/mynu/assets/logo.png",
    "lib/mynu/menu.rb",
    "lib/mynu/menu/menu_item.rb",
    "lib/mynu/menu/block_menu_item.rb",
    "lib/mynu/dsl.rb",
    "lib/mynu/dsl/block.rb",
    "lib/mynu/version.rb"
  ]
  s.homepage = %q{http://github.com/RobertLowe/mynu}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{Opinionated tool for creating and managing a system menu in osx}

  s.add_development_dependency(%q<rake>, [">= 0"])
  s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
end 