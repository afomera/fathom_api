module Fathom
  class SitesResource < Resource
    def list(**params)
      get_request("sites", params: params)
    end

    def retrieve(site_id:)
      get_request("sites/#{site_id}")
    end

    def create(**attributes)
      post_request("sites", body: attributes)
    end

    def update(site_id:, **attributes)
      post_request("sites/#{site_id}", body: attributes)
    end

    def delete(site_id:)
      delete_request("sites/#{site_id}")
    end

    def wipe(site_id:)
      delete_request("sites/#{site_id}/data")
    end
  end
end
