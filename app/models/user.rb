class User < ApplicationRecord
    has_secure_password validations: false
    validates :password, presence: true, unless: :from_social?
    has_many :purchases
    has_many :categories, through: :purchases
    belongs_to :family, optional: true
    attr_accessor :from_social
    
    def from_social?
        self.from_social == true
    end


end
