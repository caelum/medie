module Medie
  
  # Receives Json representations and turn them into hashes. Turn
  # hashes into json objects.
  class Json

    def unmarshal(content)
      def content.links
        []
      end
      content
    end

    def marshal(string, rel)
      string
    end
    
    def can_handle?(content_type)
      !(content_type.nil? || content_type.split(";")[0]!="application/json")
    end

    Medie.registry << Json.new

  end
end
