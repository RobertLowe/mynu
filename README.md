Mynu
=====

A simple DSL to create a systembar menu with macruby in OSX

![](http://i.imgur.com/yQBEE.png)

1. `gem install mynu`
2. `macruby examples/hello-mynu.rb`


An example of abusing `open [-a]`

`macruby examples/workflow.rb`


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

====

      require 'rubygems'
      require 'mynu'

      mynu = Mynu.new

      mynu.item "Applications" do |applications|
        applications.item "Terminal" do
          # TODO: AppleScript a tab, this does nothing if terminal is open
          `open -a /Applications/Utilities/Terminal.app`
        end
      end

      mynu.item "Project" do |project|
        project.item "Live" do
          `open http://example.com`
        end
        project.item "Staging" do
          `open http://user:pass@staging.example.com`
        end
        project.item "Development" do
          `open http://example.dev`
        end
        project.item "Repos" do |repos|
          repos.item "Example" do
            `open ~/example`
          end
          repos.item "Resources" do
            `open ~/example-resources`
          end
        end
      end

      mynu.items << NSMenuItem.separatorItem

      mynu.item "Development" do |development|
        development.item "Rails" do |development_mynu|
          development_mynu.item "Github" do
            `open http://github.com/rails/rails`
          end
          development_mynu.item "Repo" do
            `open ~/workspace/rails`
          end
        end
      end

      mynu.items << NSMenuItem.separatorItem

      mynu.item "Downloads" do
        `open ~/Downloads`
      end

      mynu.items << NSMenuItem.separatorItem

      desktop = mynu.item "Desktop" do
        `open ~/Desktop`
      end

      mynu.items << NSMenuItem.separatorItem


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
