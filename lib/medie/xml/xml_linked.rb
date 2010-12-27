module Medie
  module XmlLinked
    def links(*args)
      links = fetch("link", [])
      Media::Xml::LinkCollection.new(links)
    end

    def __normalize__(value)
      case value
      when Hash
        value.extend(Methodize).extend(XmlLinked)
      when Array
        value.map { |v| __normalize__(v) }
      else
        value
      end
      value
    end
  end
end
