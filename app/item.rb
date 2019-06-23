class Item
  attr_accessor :name, :price
  
  @@

  def initialize(name,price)
    @name = name
    @price = price
  end
  
    def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
 
      item_name = req.path.split("/items/").last #turn /items/fruit into fruit
      song = @@songs.find{|s| s.title == song_title}
 
      resp.write song.artist
    end
 
    resp.finish
  end
end
