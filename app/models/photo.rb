class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  #The validates() method is the standard Rails validator. It will check one
  #or more model fields against one or more conditions
  #presence: true tells the validator to check that each of the named
  #fields is present and its contents are not empty
  validates :title, :image_url, presence: true
  validates :image_url, format: { with: %r{\.(gif|jpg|png)\Z}i,
  message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
