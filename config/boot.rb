# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

require 'rails/commands/server'

module Rails
  class Server
    alias :default_options_alias :default_options
    def default_options
      if ENV['RAILS_ENV'] == 'test'
        default_options_alias.merge! :Port => 3001, :pid => 'tmp/pids/server.test.pid'
      else
        default_options_alias
      end
    end
  end
end
