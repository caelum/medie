module Medie
  class Registry
    
    # adds a new handler to this registry
    def <<(what)
      use(what)
    end
    
    # adds a new handler to this registry
    def use(what)
      registry << what
      self
    end
    
    # Returns a handler that can handle this kind of media type.
    # It will always use the last registered handler.
    def for(media_type)
      registry.reverse.find do |handler|
        handler.can_handle?(media_type)
      end
    end
    
    private
    def registry
      @registry ||= []
    end
    
  end
end