module StoryHelpers
  # Request helpers
  def get_json(path)
    get path
    json_parse(last_response.body)
  end

  def post_json(url, data)
    post(url, json(data),  'CONTENT_TYPE' => 'application/json')
    json_parse(last_response.body)
  end

  # JSON helpers
  def json_parse(body)
    MultiJson.load(body, symbolize_keys: true)
  end

  def json(hash)
    MultiJson.dump(hash, pretty: true)
  end

  # Database helpers
  def create_user(user)
    post('/v1/register', user)
  end

  def remove_user(username)
    database_conf = JSON.parse(File.read(Dir.pwd + '/config/db.json'))

    MongoMapper.setup(
        database_conf['connection'],
        ENV['SINATRA_ENV']
    )

    user = User.find_one({:username => username})
    User.destroy(user[:_id])
  end
end
