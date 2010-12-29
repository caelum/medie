module Medie
  module OpenSearch
    class Driver

      def unmarshal(xml)
        hash = Medie::Xml::Driver.new.unmarshal(xml)
        descriptor = Descriptor.new(hash)
      end

      def can_handle?(content_type)
        !(content_type.nil? || content_type.split(";")[0]!="application/opensearchdescription+xml")
      end

      Medie.registry << Driver.new
    end
  end
end

