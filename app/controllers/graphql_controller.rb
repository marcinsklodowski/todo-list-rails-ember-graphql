class GraphqlController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def query
    render json: ::Graph::Schema.execute(
      params.fetch('query'),
      context: {} # you can pass the current_user here
    )
  end
  # def query
  #   variables = params[:variables]
  #   variables = JSON.parse(variables) if variables && variables.is_a?(String)
  #
  #   render json: Graphql::TodoListSchema.execute(
  #     params[:query], variables: variables
  #   )
  # end
end
