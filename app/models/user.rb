class User < ApplicationRecord

    validates :name, presence: true, length: { in: 1..10 }
    validates :username, presence: true, uniqueness: true
end