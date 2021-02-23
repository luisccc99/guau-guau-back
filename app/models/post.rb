class Post < ApplicationRecord
    mount_uploader :photo, PostPhotoUploader
    validates :title, :body, presence: true

    belongs_to :user
    has_many :comments
    has_one :localization
end
