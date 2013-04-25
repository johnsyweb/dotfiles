gems = %w(rubygems interactive_editor hirb wirble)

gems.each do |gem|
  begin
    require gem
  rescue LoadError => err
    warn "Couldn't load #{gem} #{err}"
  end
end

begin
    Wirble.init
    Wirble.colorize
rescue NameError => err
    require 'irb/completion'
end
