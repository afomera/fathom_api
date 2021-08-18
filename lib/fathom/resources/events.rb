module Fathom
  class EventsResource < Resource
    def list(site_id:, **params)
      get_request("sites/#{site_id}/events", params: params)
    end

    def retrieve(site_id:, event_id:)
      get_request("sites/#{site_id}/events/#{event_id}")
    end

    def create(site_id:, **attributes)
      post_request("sites/#{site_id}/events", body: attributes)
    end

    def update(site_id:, event_id:, **attributes)
      post_request("sites/#{site_id}/events/#{event_id}", body: attributes)
    end

    def delete(site_id:, event_id:)
      delete_request("sites/#{site_id}/events/#{event_id}")
    end

    def wipe(site_id:, event_id:)
      delete_request("sites/#{site_id}/events/#{event_id}/data")
    end
  end
end
