require "mini_magick"
require "image_processing/mini_magick"

namespace :images do
  desc "Optimize images in app/assets/images"
  task optomize: :environment do
    source_dir = Rails.root.join("app", "assets", "images")
    destination_dir = Rails.root.join("public", "optimized_images")

    Dir.glob("#{source_dir}/**/*.*").each do
      |image_path|
      next unless File.file?(image_path)

      relative_path = image_path.sub(source_dir.to_s, "")
      destination_path = File.join(destination_dir, relative_path)
      FileUtils.mkdir_p(File.dirname(destination_path))

      unless File.file?(destination_path)
        begin
          image = ImageProcessing::MiniMagick.source(image_path).resize_to_limit(100, 100).call
          MiniMagick::Image.new(image.path).write(destination_path)

          image.write(destination_path)
          puts "Processed and saved #{destination_path}"
        rescue
          puts "Failed to process image #{image_path}"
        end
      end
    end
  end
end
