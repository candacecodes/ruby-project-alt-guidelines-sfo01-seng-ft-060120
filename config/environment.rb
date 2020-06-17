require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

ActiveRecord::Base.logger = nil

#handles all configuration details, external connections, any models or gems 
#environment is included in the rake file and can fun everything from Rakefile 