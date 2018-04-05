class Product < ApplicationRecord

  # Paperclip
  has_attached_file :image,
                    :styles => {
                        :thumb => ["40x40%", :jpg],
                        :small  => ["120x120%",:jpg],
                        :medium => ["200x200%",:jpg] }


  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, :description, :stock_quantity, :price, :category, presence: true
  validates :stock_quantity, numericality: { only_integer: true }
  validates :price, numericality: true

  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  def image_attributes=(attributes)
    # Marks the attachment for destruction on next save,
    # if the attributes hash contains a _destroy flag
    # and a new avatar was not uploaded at the same time:
    image.clear if has_destroy_flag?(attributes) && !image.dirty?
  end

  def self.search(category_id)
    if category_id != ''
      where('categories_id = ?', category_id).joins(:category)
    end
  end

end
