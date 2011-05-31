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
