class Mynu
  class Menu < NSMenu
    autoload :MenuItem,      'mynu/menu/menu_item'
    autoload :BlockMenuItem, 'mynu/menu/block_menu_item'
  end
end