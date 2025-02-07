class CarouselImage < ApplicationRecord
  has_one_attached :image
  validates :section, presence: true
  validates :title, presence: true
  validates :display_order, presence: true, numericality: { only_integer: true }

  scope :by_section, ->(section) { where(section: section).order(display_order: :asc) }

  def image_variant(size)
    case size
    when :thumbnail
      image.variant(resize_to_fill: [ 100, 100 ])
    when :medium
      image.variant(resize_to_fill: [ 400, 300 ])
    when :large
      image.variant(resize_to_fill: [ 800, 600 ])
    else
      image
    end
  end

  def hero_variant
    # Create a compressed version for hero backgrounds
    image.variant(
      resize_to_limit: [1920, nil], # Maintain aspect ratio
      strip: true,                  # Remove metadata
      quality: 80,                  # Reduce quality slightly
      interlace: "JPEG",           # Progressive loading
      saver: { subsample_mode: "on" }  # Better compression
    )
  end
end
