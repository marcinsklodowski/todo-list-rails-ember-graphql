require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  subject { JSON.parse response.body }

  it 'creates task' do
    get '/graphql', params: {
      query: 'mutation taskCreate { task: taskCreate(title: "test1") { id title } }'
    }

    expect(Task.first.title).to eq 'test1'
  end
end


