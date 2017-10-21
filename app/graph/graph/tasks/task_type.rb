module Graph
  module Tasks
    TaskType = GraphQL::ObjectType.define do
      name 'TaskType'

      field :id, types.ID
      field :title, types.String
    end
  end
end
