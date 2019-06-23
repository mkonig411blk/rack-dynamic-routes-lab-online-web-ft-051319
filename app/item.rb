class Item
  attr_accessor :name, :price
  
  @@items = []

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end
  
    def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last #turn /items/fruit into fruit
      item = @@items.find{|s| s.name == item_name}
      resp.write item.price
    end
    resp.finish
  end
end
