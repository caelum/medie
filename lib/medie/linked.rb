module Medie
  module Linked
    def links
      links = fetch(Rails.application.config.medie.links_element_name, [])
      links = [links] unless links.kind_of? Array
      @type_to_use.new(links)
    end

    def __normalize__(value)
      case value
      when Hash
        value.extend(Methodize).extend(Linked).use_link_type(@type_to_use)
      when Array
        value.map { |v| __normalize__(v) }
      else
        value
      end
      value
    end

    def use_link_type(type)
      @type_to_use = type
      self
    end
  end
end
