require 'open-uri'

URL = /https?:\/\/getfile\d*\.posterous\.com[^"]*/

posts = Dir['source/_posts/*'].to_a
posts.each do |path|
  post = File.read(path)
  post.gsub!(URL).each do |url|
    data = open(url).read
    name = File.split(url).last
    filename = File.join('source/images', name)
    raise "#{filename} exists" if File.exist?(filename)
    puts filename
    File.open(filename, 'wb') { |f| f.write(data) }
    "/images/#{name}"
  end
  File.open(path, 'w') { |f| f.write(post) }
end
