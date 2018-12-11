class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  validates :user_name, :body, presence: true
end
