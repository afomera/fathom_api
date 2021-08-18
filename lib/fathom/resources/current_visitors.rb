module Fathom
  class CurrentVisitorsResource < Resource
    def list(site_id:, **params)
      get_request("current_visitors", params: params.merge(site_id: site_id))
    end
  end
end
