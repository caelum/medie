# Medie supports by default a series of media formats, such as
# xml, json, atom, opensearch and form-urlencoded.
#
# Use register to register your own media format, but
# do not forget to contribute with your converter if
# it is a well known media type that Medie still
# does not support.
module Medie

  require 'medie/registry'
  def self.registry
    @registry ||= Registry.new
  end

  require 'medie/json'
  require 'medie/xml'
  require 'medie/generic'
  
end
