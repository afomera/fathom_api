module Fathom
  class SitesResource < Resource
    def list(**params)
      get_request("sites", params: params).body
    end

    def retrieve(site_id:)
      get_request("sites/#{site_id}").body
    end

    def create(**attributes)
      post_request("sites", body: attributes).body
    end

    def update(site_id:, **attributes)
      post_request("sites/#{site_id}", body: attributes).body
    end

    def delete(site_id:)
      delete_request("sites/#{site_id}").body
    end

    def wipe(site_id:)
      delete_request("sites/#{site_id}/data").body
    end
  end
end
