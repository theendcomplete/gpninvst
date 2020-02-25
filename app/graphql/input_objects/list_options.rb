module InputObjects
  class ListOptions < InputObjects::BaseInputObject
    argument :page, Integer, required: false, default_value: 1
    argument :limit, Integer, required: false, default_value: 25, prepare: ->(limit, _ctx) { [limit, 50].min }
    argument :efilter, GraphQL::Types::JSON, required: false
    argument :order, GraphQL::Types::JSON, required: false
  end
end
