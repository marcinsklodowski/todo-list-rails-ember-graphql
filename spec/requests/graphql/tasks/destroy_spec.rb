require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  let!(:task) {
    Task.create! title: 'test1'
  }
  subject { JSON.parse response.body }

  it 'returns all tasks' do
    get '/graphql', params: {
      query: "mutation taskDelete { task: taskDelete(id: \"#{task.id}\") { id } }"
    }

    expect(Task.count).to eq 0
  end
end
