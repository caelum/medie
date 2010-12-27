module Medie
  class XmlLinkCollection
  
    def initialize(links)
      @hash = {}
      links = [links] unless links.kind_of? Array
      links = [] unless links
      links.each { |l|
        link = Tokamak::Xml::Link.new(l)
        @hash[link.rel.to_s] = link
      }
    end

    def [](name)
      @hash[name]
    end
  
    def size
      @hash.size
    end
  
    def keys
      @hash.keys
    end
  
    def method_missing(sym, *args)
      raise "Links can not receive arguments" unless args.empty?
      self[sym.to_s]
    end
  end
end