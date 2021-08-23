module Fathom
  class AggregationsResource < Resource
    # TODO: Ensure this works properly
    def list(entity_id:, entity:, aggregates:, **params)
      get_request("aggregations", params: params.merge(entity_id: entity_id,
        entity: entity, aggregates: aggregates))
    end
  end
end
