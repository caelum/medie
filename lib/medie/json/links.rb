module Medie
  module Json
    
    # represents a set of links using json
    class Links
      def initialize(parent_node)
        #@node = parent_node
        @hash = {}
        @node = parent_node
        @node.each do |l|
          link = Medie::Link.new(l)
          @hash[link.rel.to_s] = link
        end
      end

      def refresh
        links.self.follow.get
      end

      def method_missing(symbol, *args, &block)
        raise "Links can not receive arguments" unless args.empty?
        @hash[symbol.to_s]
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

    end
  end
end