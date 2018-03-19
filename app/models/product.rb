class Product < ApplicationRecord
  belongs_to :category
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_attached_file :image

  def image_attributes=(attributes)
    # Marks the attachment for destruction on next save,
    # if the attributes hash contains a _destroy flag
    # and a new avatar was not uploaded at the same time:
    image.clear if has_destroy_flag?(attributes) && !image.dirty?
  end
end
