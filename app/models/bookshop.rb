class Bookshop < ApplicationRecord
    has_many :visits, dependent: :destroy
    has_many :users, through: :visits


    def recommendation

    end
end
