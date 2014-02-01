Mongoid.logger.level = Logger::DEBUG
Moped.logger.level = Logger::DEBUG

Mongoid.logger = Logger.new($stdout)
Moped.logger = Logger.new($stdout)

require 'mongoid/history/soft_undo'
require 'mongoid/history/publishable'
require 'locomotive/trackable_content_entry'
