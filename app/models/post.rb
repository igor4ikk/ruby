class Post < ApplicationRecord

    has_one_attached :preview_img
    has_rich_text :body
    
    validates :title, presence: true, length: {minimum: 2}
    validates :body, presence: true, length: {minimum: 2}
end
