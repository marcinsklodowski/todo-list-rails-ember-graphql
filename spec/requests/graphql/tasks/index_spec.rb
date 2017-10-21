require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  let!(:tasks) {
    Task.create! [
      { title: 'test1' },
      { title: 'test2' }
    ]
  }
  subject { JSON.parse response.body }

  it 'returns all tasks' do
    get '/graphql', params: {
      query: 'query tasks { tasks { id title } }'
    }

    expect(subject['data']['tasks'].size).to eq 2
  end
end
