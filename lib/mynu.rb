unless RUBY_ENGINE =~ /macruby/
  raise NotImplementedError, "Mynu only runs on macruby! ;)"
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

framework 'AppKit'

class Mynu
  autoload :Version,       'mynu/version'

  autoload :Menu,          'mynu/menu' # wrapping NSMenu
  autoload :Dsl,           'mynu/dsl'  # dsl modules

  autoload :Support,       'mynu/support'

  attr_accessor :__app         # the sharedApplication
  attr_accessor :__status_item # the new bar icon
  attr_accessor :__menu        # menu container

  include Dsl::Block # menu, app, open, terminal on items
  alias_method :link, :open

  attr_accessor :items

  # Prepare the application
  def initialize(icon = nil, menu_title = 'Mynu')
    @__app = NSApplication.sharedApplication

    icon = File.join(File.dirname(__FILE__), '..', 'lib') + '/mynu/assets/logo.png' if icon.nil?

    @__status_item = status_bar.statusItemWithLength(NSVariableStatusItemLength)
    @__status_item.setImage NSImage.new.initWithContentsOfFile(icon)

    @__menu = Menu.new
    @__menu.initWithTitle menu_title
    @__menu.setAutoenablesItems false

    @items = []
  end

  def run
    @__status_item.setMenu loadMenu
    @__app.run
  end

  def quit(sender)
    puts "Quitting :: Mynu"
    @__app.terminate(self)
  end

protected

  def status_bar
    NSStatusBar.systemStatusBar
  end

  def loadMenu
    @items.each do |item|
      @__menu.addItem item
    end

    quit = Menu::MenuItem.new
    quit.title = 'Quit'
    quit.action = 'quit:'
    quit.target = self
    @__menu.addItem quit

    @__menu
  end

end

