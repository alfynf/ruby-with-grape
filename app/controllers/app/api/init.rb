class App::Api::Init < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api
    # include Grape::Extensions::Hashie::Mash::ParamBuilder

    mount App::Api::User::Api
    
end