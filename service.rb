ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require 'sinatra/base'

require 'mongo'
require 'mongo_mapper'
require 'json/ext'

require './models/user'

module Api

  class App < ::Sinatra::Base

    configure do
      database_conf = JSON.parse(File.read('./config/db.json'))

      MongoMapper.setup(
          database_conf['connection'],
          ENV['SINATRA_ENV']
      )

      # Register plugins
      register ::Sinatra::Namespace
    end

    namespace '/v1' do

      get '/' do
        'hello world!'
      end

      post '/register' do
        user = {
            :username => params[:username],
            :password => params[:password],
            :email => params[:email],
            :active => true,
        }

        user = User.new(user)
        if user.save()
          [201, {'Content-Type' => 'application/json'}, 'OK'.to_json]
        else
          [400, {'Content-Type' => 'application/json'}, user.errors.to_json]
        end
      end

      get '/login' do
        user = User.authenticate(params[:username], params[:password])
        if user.nil?
          user_data = {
              :authenticated => 'KO',
              :user => '',
              :username => ''
          }
        else
          user_data = {
              :authenticated => 'OK',
              :user => user.id,
              :username => user.username
          }
        end

        [200, {'Content-Type' => 'application/json'}, user_data.to_json]
      end
    end
  end
end