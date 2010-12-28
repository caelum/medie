module Medie
  module FormUrlEncoded
    class Driver
      def self.marshal(content, rel)
          if content.kind_of? Hash
            content.map { |key, value| "#{key}=#{value}" }.join("&")
          else
            content
          end
      end
  
      def self.unmarshal(content)
      	def content.links
          []
        end
        content
      end

      def can_handle?(content_type)
        !(content_type.nil? || content_type.split(";")[0]!="application/x-www-form-urlencoded")
      end

      Medie.registry << Driver.new
    end
  end
end