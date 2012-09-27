require 'bubble-wrap/core'
require 'bubble-wrap/http'

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'motion-rails-model/*rb')).each do |file|
    app.files.unshift(file)
  end
end