module Fathom
  class SitesResource < Resource
    def list(**params)
      get_request("sites", params: params).body
    end

    def retrieve(id)
      get_request("sites/#{id}").body
    end
  end
end
