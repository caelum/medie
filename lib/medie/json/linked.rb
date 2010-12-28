module Medie
  module Json
    module Linked
      def links
        some_links = self["link"]
        return nil unless some_links
        some_links = [some_links] unless some_links.kind_of? Array
        Json::Links.new(some_links)
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