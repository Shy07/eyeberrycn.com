
Dir.glob('*.jpg').each_with_index do |filename, idx|
	system "mv #{filename} #{"%05d.jpg" % idx}"
end
