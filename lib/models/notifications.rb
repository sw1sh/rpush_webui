require 'rpush'
load 'config/rpush.rb'

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
    @notifications = Rpush::Notification.all
  end
  
  def data
    fetch = -> a { a['delivered'] ? [true, a['delivered_at']] : [false, a['failed_at']] }
    @notifications
      .map(&:attributes)
      .map(&fetch)
      .select { |_,d| d.to_i >= @start_at.to_i && d.to_i <= @finish_at.to_i }
      .group_by { |_,d| (d.to_i - @start_at.to_i) / @dt.to_i }
      .map_value { |g| {true => 0, false => 0}.merge g.group_by(&:first).map_value(&:size) }
  end

 end
