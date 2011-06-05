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
