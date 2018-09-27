Dir.foreach(File.dirname(__FILE__)) do |filename|
  next if filename == File.basename(__FILE__)

  require_relative filename if filename.end_with?('.rb')
end
