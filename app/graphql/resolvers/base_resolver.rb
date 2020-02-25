module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    argument_class Arguments::BaseArgument
    include Helpers::Authorize
  end
end
