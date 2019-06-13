class PostComment < ApplicationRecord

    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    belongs_to :writer, class_name: 'User', foreign_key: 'writer_id'
end
