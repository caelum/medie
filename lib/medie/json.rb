require 'methodize'
require 'medie/json/linked_json'
require 'medie/json/link_collection'
require 'json'

module Medie
  
  # Receives Json representations and turn them into hashes. Turn
  # hashes into json objects.
  class Json

    def unmarshal(content)
      if content.nil?
        return {}.extend(Methodize).extend(LinkedJson)
      end
      
      ::JSON.parse(content).extend(Methodize).extend(LinkedJson)
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

    Medie.registry << Json.new

  end
end
