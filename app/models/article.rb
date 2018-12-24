class Article < ApplicationRecord
    belongs_to :user
    validates :header, presence: true, length: {minimum: 1, maximum: 5}
    validates :title, presence: true, length: { minimum: 1, maximum: 10 }
    validates :description, presence: true, length: { minimum: 5, maximum: 300 }
    validates :user_id, presence: true
end
