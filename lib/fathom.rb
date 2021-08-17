module Fathom
  autoload :Client, "fathom/client"
  autoload :Resource, "fathom/resource"
  autoload :Object, "fathom/object"

  # Resources (like high level API endpoints)
  autoload :AccountResource, "fathom/resources/account"
  autoload :SitesResource, "fathom/resources/sites"

  # Objects we wrap the responses in
  autoload :Account, "fathom/objects/account"
  autoload :Site, "fathom/objects/site"

  def self.api_key=(key)
    @api_key = key
  end

  def self.api_key
    @api_key
  end

  class Error < StandardError; end
  # Your code goes here...
end
