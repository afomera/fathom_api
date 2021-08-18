module Fathom
  class EventsResource < Resource
    def list(site_id:, **params)
      get_request("sites/#{site_id}/events", params: params).body
    end

    def retrieve(site_id:, event_id:)
      get_request("sites/#{site_id}/events/#{event_id}").body
    end

    def create(site_id:, **attributes)
      post_request("sites/#{site_id}/events", body: attributes).body
    end

    def update(site_id:, event_id:, **attributes)
      post_request("sites/#{site_id}/events/#{event_id}", body: attributes).body
    end

    def delete(site_id:, event_id:)
      delete_request("sites/#{site_id}/events/#{event_id}").body
    end

    def wipe(site_id:, event_id:)
      delete_request("sites/#{site_id}/events/#{event_id}/data").body
    end
  end
end
