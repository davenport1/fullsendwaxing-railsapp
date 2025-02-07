namespace :carousel_images do
  desc "Migrate existing images to carousel system"
  task migrate: :environment do
    # Directory containing your images
    images_path = Rails.root.join("app/assets/images")

    Dir.glob("#{images_path}/*").each do |file_path|
      next unless File.file?(file_path)

      # Get filename without extension
      filename = File.basename(file_path, ".*")

      # Create a new carousel image record
      carousel_image = CarouselImage.new(
        section: "main", # You can modify this based on your needs
        title: filename.titleize,
        display_order: CarouselImage.count + 1,
        active: true
      )

      # Attach the image using Active Storage
      carousel_image.image.attach(
        io: File.open(file_path),
        filename: File.basename(file_path)
      )

      if carousel_image.save
        puts "Successfully imported: #{filename}"
      else
        puts "Failed to import: #{filename} - #{carousel_image.errors.full_messages.join(', ')}"
      end
    end
  end
end
