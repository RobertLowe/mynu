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

mynu.menu "Applications" do |applications|
  applications.app "TextEdit", "/Applications/TextEdit.app"
end

mynu.menu "Project" do |project|
  project.terminal "Working Directory", "~/example"
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
