class User < ApplicationRecord
    has_many :visits, dependent: :destroy
    has_many :bookshops, through: :visits
    has_many :friender_friendships, class_name: "Friendship", foreign_key: "friender_id"
    has_many :friendees, through: :friender_friendships, source: :friendee, dependent: :destroy
    

    has_many :friendee_friendships, class_name: "Friendship", foreign_key: "friendee_id"
    has_many :frienders, through: :friendee_friendships, source: :friender, dependent: :destroy

    validates :username, presence: true, uniqueness: true

    has_secure_password

    def visited?(bookshop)
        self.visits.find_by(bookshop_id: bookshop.id, user_id: self.id)
    end

    def incoming_recs
        array = []
        self.friendee_friendships.each do |friendship|
            friendship.recommendations.each do |recommendation|
                array << [friendship.friender, Bookshop.find(recommendation.bookshop_id)]
            end
        end
        array
    end

    def outgoing_recs
        array = []
        self.friender_friendships.each do |friendship|
            friendship.recommendations.each do |recommendation|
                array << [friendship.friendee, Bookshop.find(recommendation.bookshop_id)]
            end
        end
        array
    end
end
