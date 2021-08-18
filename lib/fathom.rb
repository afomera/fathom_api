require "faraday"
require "faraday_middleware"
require "fathom/version"

module Fathom
  autoload :Client, "fathom/client"
  autoload :Resource, "fathom/resource"
  autoload :Object, "fathom/object"

  # Resources (like high level API endpoints)
  autoload :AccountResource, "fathom/resources/account"
  autoload :EventsResource, "fathom/resources/events"
  autoload :SitesResource, "fathom/resources/sites"

  # Objects we wrap the responses in
  autoload :Account, "fathom/objects/account"
  autoload :Site, "fathom/objects/site"

  class Error < StandardError; end
  # Your code goes here...
end
