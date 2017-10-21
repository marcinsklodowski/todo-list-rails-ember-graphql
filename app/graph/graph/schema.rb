module Graph
  Schema = GraphQL::Schema.define do
    query Graph::Tasks::QueryType
    mutation Graph::Tasks::MutationType
  end
end
