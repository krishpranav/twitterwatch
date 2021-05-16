require "singleton"
require "yaml"
require "sequel"
require "twitter"
require "colorize"
require "thread/pool"
require "httparty"
require "terminal-table"
require "highline/import"
require "tty-pager"
require "sentimental"
require "graphviz"
require "chronic"
require "magic_cloud"
require "cairo"
require "twitterwatch/version"
require "twitterwatch/util"
require "twitterwatch/http_client"
require "twitterwatch/klout_client"
require "twitterwatch/punchcard"
require "twitterwatch/kml"
require "twitterwatch/word_list"
require "twitterwatch/console"
require "twitterwatch/configuration"
require "twitterwatch/configuration_wizard"

Dir[File.join(File.dirname(__FILE__), "twitterwatch", "concerns", "*.rb")].each do |file|
  require file
end

require "twitterwatch/command"
require "twitterwatch/module"

Dir[File.join(File.dirname(__FILE__), "twitterwatch", "commands", "*.rb")].each do |file|
  require file
end

Dir[File.join(File.dirname(__FILE__), "twitterwatch", "modules", "**/*.rb")].each do |file|
  require file
end

module twitterwatch
  # Your code goes here...
end
