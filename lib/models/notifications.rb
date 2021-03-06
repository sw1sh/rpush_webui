require 'rpush'
require 'yaml'

@config = YAML.load_file('config/rpush_webui.yml')
require @config['rpush_config_file']

if Rpush.config.client == :active_record
  ActiveRecord::Base.configurations = YAML.load_file 'config/database.yml'
  ActiveRecord::Base.establish_connection 
end 

class Hash
  def map_value
    self.map { |k,v| {k => yield(v)} }.reduce(:merge)
  end
end

class Notifications
  
  def initialize(**options)
    @dt = options[:dt]
    @start_at = options[:start_at]
    @finish_at = options[:finish_at]
  end
  
  def data
    fetch = -> a { a['delivered'] ? [true, a['delivered_at']] : [false, a['failed_at']] }
    Rpush::Notification
      .where('delivered_at between ? and ? or failed_at between ? and ?', @start_at, @finish_at, @start_at, @finish_at)
      .load
      .map(&:attributes)
      .map(&fetch)
      .select { |_,d| d.to_i >= @start_at.to_i && d.to_i <= @finish_at.to_i }
      .sort_by(&:last)
      .group_by { |_,d| (d.to_i - @start_at.to_i) / @dt.to_i }
      .map_value { |g| {true => 0, false => 0}.merge g.group_by(&:first).map_value(&:size) }
  end

 end

