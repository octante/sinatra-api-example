require_relative '../story_helper.rb'

describe 'Api::App::UsersStory', :story do

  describe 'POST /register' do
    before do
      post(
          '/v1/register',
          {
              :username => 'johnsmith',
              :password => '123456',
              :telephone => '5555555',
              :email => 'johnsmith@test.com'
          }
      )
    end

    it 'responds successfully' do
      last_response.status.must_equal 201
    end

    after do
      remove_user('johnsmith')
    end
  end

  describe 'GET /login' do
    before do
      user = {
          :username => 'johnsmith',
          :password => '123456',
          :telephone => '5555555',
          :email => 'johnsmith@test.com'
      }
      create_user(user)

      get('/v1/login?username=johnsmith&password=123456')
    end

    let(:json) { json_parse(last_response.body)}

    it 'responds successfully' do
      last_response.status.must_equal 200
    end

    it 'returns valid authenticated code' do
      json[:authenticated].must_equal 'OK'
    end

    it 'returns valid user' do
      json[:username].must_equal 'johnsmith'
    end

    after do
      remove_user('johnsmith')
    end
  end
end