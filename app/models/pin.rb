class Pin < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :picture, presence: true
  validates :title, presence: true
  validate :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 3.megabytes
      errors.add(:picture, "should be less than 3MB")
    end
  end
end
