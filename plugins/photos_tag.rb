require "mini_magick"

module Jekyll

  class ThumbsTag < Liquid::Block
    def render(context)
      super.split("\n").map do |path|
        if path != ''
          thumb_path = path.sub(/\.(png|jpg)$/, '.tn.\1')
          filename = File.join('source', path.sub(/^\//, ''))
          raise "#{filename} not found" unless File.exist?(filename)
          thumb_filename = filename.sub(/\.(png|jpg)$/, '.tn.\1')
          unless File.exist?(thumb_filename)
            image = MiniMagick::Image.open(filename)
            image.resize '100x100^'
            image.crop '100x100+0+0'
            image.write thumb_filename
          end
          "<a href='#{path}'><img class='thumb' src='#{thumb_path}'/></a>"
        end
      end.compact.join(' ')
    end
  end

end

Liquid::Template.register_tag('thumbs', Jekyll::ThumbsTag)
