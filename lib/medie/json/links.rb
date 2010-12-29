module Medie
  module Json
    
    # represents a set of links using json
    class Links
      def initialize(parent_node)
        @node = parent_node
      end

      def refresh
        links.self.follow.get
      end

      def method_missing(symbol, *args, &block)
        linkset = @node.select {|link| link.rel == symbol.to_s }
        linkset.map! { |link| Medie::Link.new(link) }
        unless linkset.empty?
          linkset.size == 1 ? linkset.first : linkset
        else
          nil
        end
      end
    end
  end
end