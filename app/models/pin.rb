class Pin < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validate :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 3.megabytes
      errors.add(:picture, "should be less than 3MB")
    end
  end
end
