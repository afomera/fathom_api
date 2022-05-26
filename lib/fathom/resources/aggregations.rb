module Fathom
  class AggregationsResource < Resource
    # TODO: Ensure this works properly
    def list(entity_id:, entity:, aggregates:, **params)
      filters = params.delete(:filters) || {}
      filters = filters.to_json if filters.is_a?(Hash)

      params.merge!(
        entity_id: entity_id,
        entity: entity,
        aggregates: aggregates,
        filters: filters
      )

      get_request("aggregations", params: params)
    end
  end
end
