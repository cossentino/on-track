class User < ApplicationRecord
    has_secure_password validations: false
    validates :password, presence: true, unless: :from_social?
    validates :email, uniqueness: true
    has_many :purchases
    has_many :categories, through: :purchases
    belongs_to :family, optional: true
    
    def from_social?
        self.from_social == true
    end


end
