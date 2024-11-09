# frozen_string_literal: true

require_relative "lib/active_model/config/version"

version = ActiveModel::Config.version

Gem::Specification.new do |spec|
  spec.name        = "activemodel-config"
  spec.version     = version
  spec.authors     = [ "Tony Burns" ]
  spec.email       = [ "tony@tonyburns.net" ]
  spec.homepage    = "https://github.com/tbhb/activemodel-config"
  spec.summary     = "ActiveModel-based configuration for libraries and applications."
  spec.description = "ActiveModel-based configuration for libraries and applications."
  spec.license     = "MIT"

  spec.metadata = {
    "bug_tracker_uri"   => "https://github.com/tbhb/activemodel-config/issues",
    "changelog_uri"     => "https://github.com/tbhb/activemodel-config/blob/v#{version}/CHANGELOG.md",
    "documentation_uri" => "https://github.com/tbhb/activemodel-config",
    "mailing_list_uri"  => "https://github.com/tbhb/activemodel-config/discussions",
    "source_code_uri"   => "https://github.com/tbhb/activemodel-config/tree/v#{version}",
    "rubygems_mfa_required" => "true"
  }

  spec.files = Dir["CHANGELOG.md", "MIT-LICENSE", "README.md", "lib/**/*"]
  spec.require_path = "lib"

  spec.required_ruby_version = ">= 3.2.0"

  rails_version = '>= 7.2.0'
  spec.add_dependency 'activemodel', rails_version
  spec.add_dependency 'activesupport', rails_version

  spec.add_dependency 'bundler', '>= 1.15.0'
end
