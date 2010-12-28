module Medie
  module Json
    module Linked
      def links
        links = fetch("link", [])
        links = [links] unless links.kind_of? Array
        Links.new(links)
      end

      def __normalize__(value)
        case value
        when Hash
          value.extend(Methodize).extend(Json::Linked)
        when Array
          value.map { |v| __normalize__(v) }
        else
          value
        end
        value
      end
    end
  end
end