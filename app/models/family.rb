class Family < ApplicationRecord
    has_many :members, class_name: "User"
end
