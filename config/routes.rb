Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/graphql', to: 'graphql#query'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
end
