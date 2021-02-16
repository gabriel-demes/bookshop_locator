class User < ApplicationRecord
    has_many :visits, dependent: :destroy
    has_many :bookshops, through: :visits
end
