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
      if @@items.find{|s| s.name == item_name}
        resp.write @@items.find{|s| s.name == item_name}.price
      else 
        resp.write "Route not found"
        resp.status = 404
      end
    end
    resp.finish
  end
end
