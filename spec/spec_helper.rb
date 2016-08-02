RSpec.configure do |config|
  #Color in STDOUT
  config.color_enabled = true

  config.tty = true

  #Use the specified formatter
  config.formatter = :documentation
end
