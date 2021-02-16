class User < ApplicationRecord
    has_many :friender_friendships, class_name: "Friendship", foreign_key: "friender_id"
    has_many :friendees, through: :friender_friendships, source: :friendee, dependent: :destroy
    

    has_many :friendee_friendships, class_name: "Friendship", foreign_key: "friendee_id"
    has_many :frienders, through: :friendee_friendships, source: :friender, dependent: :destroy
end
