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
