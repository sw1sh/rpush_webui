require 'rpush'
load 'config/rpush.rb'

class Hash
  def map_value
    self.map { |k,v| {k => yield(v)} }.reduce(:merge)
  end
end

class Notifications
  
  def initialize(from, dt)
    @from = from
    @dt = dt
    @notifications = Rpush::Notification.all
  end
  
  def data
    fetch = -> a { a['delivered'] ? [true, a['delivered_at']] : [false, a['failed_at']] }
    @notifications.map(&:attributes).map(&fetch).sort_by(&:last)
      .group_by { |_,d| (d.to_i - @from.to_i) / @dt.to_i }.map_value { |g| {true => 0, false => 0}.merge g.group_by(&:first).map_value(&:size) }
  end

 end
