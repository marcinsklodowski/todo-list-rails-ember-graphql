require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  let!(:task) { Task.create! title: 'test1' }
  let(:new_title) { 'updated!' }
  subject { JSON.parse response.body }

  it 'returns all tasks' do
    get '/graphql', params: {
      query: "mutation taskUpdate { task: taskUpdate(id: \"#{task.id}\", title: \"#{new_title}\") { id title } }"
    }

    expect(Task.first.title).to eq new_title
  end
end
