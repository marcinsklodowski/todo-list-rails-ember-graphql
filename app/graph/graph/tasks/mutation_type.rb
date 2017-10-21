module Graph
  module Tasks
    MutationType = GraphQL::ObjectType.define do
      name 'TaskMutation'

      field :taskUpdate, TaskType do
        argument :id, !types.ID
        argument :title, !types.String
        resolve -> (_object, arguments, _context) do
          task = Task.find(arguments[:id])
          task.update! title: arguments[:title]
          task
        end
      end

      field :taskCreate, TaskType do
        argument :title, !types.String
        resolve -> (_object, arguments, _context) do
          task = Task.create!(title: arguments[:title])
          task
        end
      end

      field :taskDelete, TaskType do
        argument :id, !types.String
        resolve -> (_object, arguments, _context) do
          task = Task.find(arguments[:id])
          task.destroy
        end
      end
    end
  end
end
