module Medie
  
  # a link object
  class Link
    def initialize(obj)
      @obj = obj
    end
  
    def type
      content_type
    end
  
    def href
      @obj["href"]
    end
  
    def rel
      @obj["rel"]
    end
    def content_type
      @obj["type"]
    end
      
    def method_missing(symbol, *args, &block)
      @obj.send(symbol, *args, &block)
    end
  
    def to_s
      "<link to #{@options}>"
    end
  end
end