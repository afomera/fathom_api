require "faraday"
require "faraday_middleware"
require "fathom/version"

module Fathom
  autoload :Client, "fathom/client"
  autoload :Resource, "fathom/resource"
  autoload :Object, "fathom/object"

  # Resources (like high level API endpoints)
  autoload :AccountResource, "fathom/resources/account"
  autoload :AggregationsResource, "fathom/resources/aggregations"
  autoload :CurrentVisitorsResource, "fathom/resources/current_visitors"
  autoload :EventsResource, "fathom/resources/events"
  autoload :SitesResource, "fathom/resources/sites"

  # Objects we wrap the responses in
  autoload :Account, "fathom/objects/account"
  autoload :Event, "fathom/objects/event"
  autoload :List, "fathom/objects/list"
  autoload :Site, "fathom/objects/site"

  class Error < StandardError; end

  def self.build_object(data)
    return data unless data.is_a?(Hash)
    type = data.fetch("object", "object")
    class_name = type.split("_").map(&:capitalize).join
    Fathom.const_get(class_name).new(data)
  end
end
