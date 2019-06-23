  class Application 
    
    def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last #turn /items/fruit into fruit
      if @@items.find{|s| s.name == item_name}
        item = @@items.find{|s| s.name == item_name}
        resp.write item.price
      else 
        resp.status = 400
      end
    else 
      
    end
    resp.finish
  end
end