require 'rubygems'
require 'irb/completion' # enable word completion
require 'irb/ext/save-history' # enable history
require 'wirble' # enable colorization

# ls command
def ls(arg)
  system "vi #{arg}"
end

# vi command
def vi(arg)
  system "vi #{arg}"
end

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.irb-history")

# Wirbleというプラグインを使用
Wirble.init
Wirble.colorize

