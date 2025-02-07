module CarouselHelper
  def carousel_images_for(section)
    CarouselImage.by_section(section).where(active: true)
  end
end
