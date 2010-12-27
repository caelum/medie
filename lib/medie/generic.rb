module Medie
  
  # This is a simple implementation of a media type that provides no links
  # and no marshalling, except the content itself. There is no parsing.
  class Generic

    # Because there is no media type registered
    # return the content itself
    def unmarshal(content)
      def content.links
        []
      end
      content
    end

    # Because there is no media type registered, return the string itself.
    def marshal(string, rel)
      string
    end

  end
end
