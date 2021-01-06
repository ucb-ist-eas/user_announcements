$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_announcements/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_announcements"
  s.version     = UserAnnouncements::VERSION
  s.authors     = ["Steve Downey"]
  s.email       = ["steve.downtown@gmail.com"]
  s.homepage    = "https://github.com/stevedowney/user_announcements"
  s.summary     = "Manage and display site-wide announcements by user, scoped by user role."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "CHANGELOG.md", "Rakefile", "README.md"]

  s.platform       = RUBY_PLATFORM =~ /java/ ? 'jruby' : 'ruby'

  s.add_dependency "rails"
  s.add_dependency "jquery-rails"
  
end
