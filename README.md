Mynu
=====

A simple DSL to create a systembar menu with macruby in OSX

![](http://i.imgur.com/yQBEE.png)

1. `gem install mynu`
2. `macruby examples/dsl.rb`

Usage example:
`macruby examples/dsl.rb`

      require 'rubygems'
      require 'mynu'

      mynu = Mynu.new

      mynu.menu "Hello World!" do |menu|
        puts "Inside menu setup!"
        menu.title = "Good Bye World!"
        menu.item "Option 1" do |item|
          item.execute do
            puts "Execution block"
            item.title = "Dynamically changed!"
          end
        end
        menu.menu "Option 2" do |menu|
          menu.item "Option 2a" do
            puts "Option 2a clicked!"
          end
          menu.item "Option 2b" do
            puts "Option 2b clicked!"
          end
          menu.execute do |menu|
            puts "Menu clicked!"
            menu.title = "Dynamically changed!"
          end
        end
        capture_menu_item = menu.item "Disabled" do |item|
          item.disabled
        end
        capture_menu_item.disabled
        menu.item "Enable `Disabled`" do |item|
          capture_menu_item.enabled
          item.execute do
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

A workflow example:
`macruby examples/workflow.rb`

      mynu = Mynu.new

      mynu.menu "Applications" do |applications|
        applications.app "TextEdit", "/Applications/Utilities/Terminal.app"
      end

      mynu.menu "Project" do |project|
        project.link "Live",        "http://example.com"
        project.link "Staging",     "http://user:pass@staging.example.com"
        project.link "Development", "http://example.dev"
        project.menu "Repos" do |repos|
          repos.open "Example", "~/example"
          repos.open "Resources", "~/example-resources"
        end
      end

      mynu.separator

      mynu.menu "Development" do |development|
        development.menu "Rails" do |rails|
          rails.link "Github", "http://github.com/rails/rails"
          rails.open "Repo", "~/workspace/rails"
        end
      end

      mynu.separator
      mynu.open "Downloads", "~/Downloads"
      mynu.separator
      mynu.open "Desktop", "~/Desktop"
      mynu.separator

      mynu.run


A terminal example (best used with Visor and one terminal window!):
`macruby examples/terminal.rb`

      require 'rubygems'
      require 'mynu'

      mynu = Mynu.new

      #############################################################
      # Warning!
      #
      # This makes the assumation you use Visor and only manage
      # one terminal window. Otherwise tabs will only be created
      # in your first/primary terminal window.
      #
      # You can get Visor at: http://visor.binaryage.com/
      #
      #############################################################

      # Normal usage will return to the frontmost app at execution
      mynu.terminal "Echo & Disable Item", "echo hello" do
        disabled
      end

      mynu.terminal "Echo & Exit", "echo hello", :exit => true do
        disabled
      end

      mynu.terminal "Keeps focus on Terminal Tab", "echo hello", :focus => true do
        disabled
      end

      mynu.run



Todo
=====
 * Improved API (done!)
 * Reloading?
 * Crash Handling?
 * FileMenuItem
 * Simple Dialogs

# Copyright (C) 2011 by Robert Lowe <rob[!]iblargz.com> - MIT
