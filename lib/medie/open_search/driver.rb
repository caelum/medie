module Medie
  module OpenSearch
    class Driver

      def self.unmarshal(xml)
        hash = Medie::Xml::Driver.new.unmarshal(xml)
        descriptor = Descriptor.new(hash)
      end

      def can_handle?(content_type)
        !(content_type.nil? || content_type.split(";")[0]!="application/opensearchdescription+xml")
      end

    end
  end
end

