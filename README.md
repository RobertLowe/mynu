Mynu
=====

A simple DSL to create a systembar menu with macruby in OSX


1. `gem install mynu`
2. `macruby examples/hello-mynu.rb`

Or if your feeling bohemian:

`macruby examples/queen.rb`


      require 'rubygems'
      require 'mynu'

      mynu = Mynu.new

      mynu.item "Hello World!" do |menu|
        puts "Inside menu setup!"
        menu.title = "Good Bye World!"
        menu.item "Option 1" do |sub_menu|
          sub_menu.execute do
            puts "Execution block"
            sub_menu.title = "Dynamically changed!"
          end
        end
        menu.item "Option 2" do |sub_menu|
          sub_menu.item "Option 2a" do
            puts "Option 2a clicked!"
          end
          sub_menu.item "Option 2b" do
            puts "Option 2b clicked!"
          end
          sub_menu.execute do
            puts "Execution block and items"
            sub_menu.title = "Dynamically changed!"
          end
        end
        capture_menu_item = menu.item "Disabled" do |sub_menu|
          sub_menu.disabled
        end
        menu.item "Enable `Disabled`" do |sub_menu|
          sub_menu.execute do
            capture_menu_item.enabled
            capture_menu_item.execute do
              capture_menu_item.title = "Disabled (Again)!"
              capture_menu_item.disabled
            end
          end
        end
      end

      mynu.item "Simple Item" do
        puts "Hello World!"
      end

      mynu.run



Todo
=====
 * Lots
 * Reloading
 * Crash Handling
 * FileMenuItem
 * Improved API
 * Simple Dialogs?

# Copyright (C) 2011 by Robert Lowe <rob[!]iblargz.com> - MIT
