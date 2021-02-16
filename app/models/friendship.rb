class Friendship < ApplicationRecord
    belongs_to :friender, class_name: "User", foreign_key: "friender_id"
    belongs_to :friendee, class_name: "User", foreign_key: "friendee_id"

    after_create :create_inverse, unless: :has_inverse?
    after_destroy :destroy_inverse, if: :has_inverse?

    def create_inverse
        self.class.create(inverse_friendship)
    end

    def destroy_inverse
        inverses.destroy_all
    end

    def has_inverse?
        self.class.exists?(inverse_friendship)
    end

    def inverses
        self.class.where(inverse_friendship)
    end

    def inverse_friendship
        {friendee_id: friender_id, friender_id: friendee_id}
    end

    def friendee_name
        friendee.name
    end


end
