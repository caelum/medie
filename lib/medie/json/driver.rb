module Medie
  module Json
    # Receives Json representations and turn them into hashes. Turn
    # hashes into json objects.
    class Driver

      def unmarshal(content)
        if content.nil?
          return {}.extend(Methodize).extend(Linked)
        end
    
        ::JSON.parse(content).extend(Methodize).extend(Linked)
      end

      def marshal(obj, rel)
        if obj.kind_of? String
          obj
        else
          obj.to_json
        end
      end
  
      def can_handle?(content_type)
        !(content_type.nil? || content_type.split(";")[0]!="application/json")
      end
    
    end

    Medie.registry << Driver.new
  end
end