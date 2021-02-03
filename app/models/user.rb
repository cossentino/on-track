class User < ApplicationRecord
    has_secure_password
    has_many :purchases
    has_many :categories, through: :purchases
    belongs_to :family
end
