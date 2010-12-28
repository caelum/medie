module Medie
  module OpenSearch
    class Descriptor
  
      def initialize(hash)
        @hash = hash["OpenSearchDescription"]
      end
  
      def urls
        uris = @hash["Url"]
        uris.kind_of?(Array) ? uris : [uris]
      end
  
    end
  end
end