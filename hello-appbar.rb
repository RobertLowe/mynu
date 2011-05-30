# Copyright (C) 2011 by Robert Lowe <rob[!]iblargz.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

framework 'AppKit'

class App
  attr_accessor :app         # the sharedApplication
  attr_accessor :status_item # the new bar icon
  attr_accessor :menu        # menu options
  attr_accessor :items       # menu items
  attr_accessor :blocks      # ruby blocks


  # Prepare the application
  def initialize(icon = 'logo.png', menu_title = 'Hacks')
    @app = NSApplication.sharedApplication

    @status_item = status_bar.statusItemWithLength(NSVariableStatusItemLength)
    @status_item.setImage NSImage.new.initWithContentsOfFile(icon)

    @menu = NSMenu.new
    @menu.initWithTitle menu_title

    @items    = []
    @blocks ||= {}
  end

  def add_ruby_block(title, &block)
    if block_given?
      item = NSMenuItem.new
      item.title = title
      item.action = 'run_ruby_block:'
      item.target = self
      @items << item

      @blocks[title] = block
    else
      raise
    end
  end
  
  def run_ruby_block(sender)
    get_ruby_block(sender.title).call(self)
  end

  def get_ruby_block(title)
    @blocks[title]
  end

  def run
    @status_item.setMenu loadMenu
    @app.run
  end

  def quit(sender)
    puts "Quitting :: BlockApp"
    @app.terminate(self)
  end
  
  def blocks
    @blocks
  end

protected

  def status_bar
    NSStatusBar.systemStatusBar
  end

  def loadMenu
    @items.each do |item|
      @menu.addItem item
    end

    quit = NSMenuItem.new
    quit.title = 'Quit'
    quit.action = 'quit:'
    quit.target = self
    @menu.addItem quit

    @menu
  end

end


application = App.new

application.add_ruby_block "Hello World!" do |app, title|
  title = "Hello World!" if title.nil?

  puts "from inside '#{title}'"

  alert = NSAlert.new
  alert.messageText = 'MacRuby StatusBar Application'
  alert.informativeText = "Cool, huh?\n#{title}"
  alert.alertStyle = NSInformationalAlertStyle
  alert.addButtonWithTitle("Ohhhhhhhh, Yeah!")
  response = alert.runModal
end

application.add_ruby_block "Good bye world!" do |app|
  app.get_ruby_block("Hello World!").call(app, "Good bye world!")
end

application.run