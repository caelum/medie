require "rails"

module Medie
  class Railtie < ::Rails::Railtie
    config.medie = ActiveSupport::OrderedOptions.new
    config.medie.links_element_name ActiveSupport::OrderedOptions.new
    config.medie.links_element_name = "link"
  end
end
