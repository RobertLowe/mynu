unless RUBY_ENGINE =~ /macruby/
  raise NotImplementedError, "Mynu only runs on macruby! ;)"
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

framework 'AppKit'

class Mynu
  autoload :Version,       'mynu/version'

  autoload :Menu,          'mynu/menu' # wrapping NSMenu
  autoload :Dsl,           'mynu/dsl'  # dsl modules

  include Dsl::Block

  attr_accessor :app         # the sharedApplication
  attr_accessor :status_item # the new bar icon
  attr_accessor :menu        # menu container
  attr_accessor :items       # root items

  # Prepare the application
  def initialize(icon = nil, menu_title = 'Mynu')
    @app = NSApplication.sharedApplication

    icon = File.join(File.dirname(__FILE__), '..', 'lib') + '/mynu/assets/logo.png' if icon.nil?

    @status_item = status_bar.statusItemWithLength(NSVariableStatusItemLength)
    @status_item.setImage NSImage.new.initWithContentsOfFile(icon)

    @menu = Menu.new
    @menu.initWithTitle menu_title
    @menu.setAutoenablesItems false
    
    @items = []
  end

  def run
    @status_item.setMenu loadMenu
    @app.run
  end

  def quit(sender)
    puts "Quitting :: Mynu"
    @app.terminate(self)
  end

protected

  def status_bar
    NSStatusBar.systemStatusBar
  end

  def loadMenu
    @items.each do |item|
      @menu.addItem item
    end

    quit = Menu::MenuItem.new
    quit.title = 'Quit'
    quit.action = 'quit:'
    quit.target = self
    @menu.addItem quit

    @menu
  end

end

