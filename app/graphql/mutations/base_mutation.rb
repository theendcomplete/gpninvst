module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include Helpers::Authorize
  end
end
