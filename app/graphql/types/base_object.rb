module Types
  class BaseObject < GraphQL::Schema::Object
    include Helpers::Authorize
  end
end
