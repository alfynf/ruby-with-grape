class App::Api::User::Entities < Grape::Entity
    expose :name
    expose :username
end

class App::Api::User::Api < Grape::API

    desc 'greet user'
    params do
        optional :name, type: String, regexp: /^[A-Za-z ]*$/
    end
    post '/greet' do
        data = "Hello #{params[:name]}"
        present :message, data
    end

    resource :user do
        desc 'get user'
        get '/' do
            data = User.all
            present :data, data, with: App::Api::User::Entities
        end

        desc 'create user'
        params do 
            requires :name, type: String
            requires :username, type: String
        end
        post '/' do
            user = User.new
            user.name = params[:name]
            user.username = params[:username]
            user.save
            present :data, user, with: App::Api::User::Entities
        end
    end

end