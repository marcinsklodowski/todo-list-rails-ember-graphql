module Graph
  module Tasks
    QueryType = GraphQL::ObjectType.define do
      name 'TaskQuery'

      field :task, TaskType do
        argument :id, !types.ID
        resolve -> (_object, arguments, _context) do
          Task.find(arguments[:id])
        end
      end

      field :tasks do
        type types[TaskType]
        resolve -> (_object, arguments, _context) do
          Task.all
        end
      end
    end
  end
end
