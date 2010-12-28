module Medie
  module Xml
    class Driver
      def marshal(obj, options = {})
        if(obj.kind_of?(String))
          obj
        elsif obj.kind_of?(Hash) && obj.size==1
          root = obj.values.first
          if !root.respond_to?(:to_xml)
            raise "Trying to marshal a string into xml does not make sense: '#{obj}'"
          end
          root.to_xml(:root => obj.keys.first)
        else
          obj.to_xml
        end
      end

      def unmarshal(content)
        if content
          hash = Hash.from_xml(content)
        else
          hash = {}
        end
        hash.extend(Methodize).extend(Linked)
      end

      def can_handle?(content_type)
        !(content_type.nil? || content_type.split(";")[0]!="application/xml")
      end
    end
  end
end