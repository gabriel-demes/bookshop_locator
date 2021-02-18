class Bookshop < ApplicationRecord
    has_many :visits, dependent: :destroy
    has_many :users, through: :visits


    def recommendation

    end

    def rating_pic
        rating = self.rating.to_s
        rating = "r#{rating[0]}_#{rating[2]}"
    end
end
