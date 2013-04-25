begin
    require 'wirble'

    Wirble.init
    Wirble.colorize
rescue LoadError => err
    warn "Couldn't load Wirble: #{err}"
    require 'irb/completion'
end

begin
  require 'rubygems'
  require 'interactive_editor'
rescue LoadError => err
  warn "Couldn't load interactive_editor: #{err}"
end
