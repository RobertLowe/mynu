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

# context: http://www.reddit.com/r/videos/comments/hny86/reddit_performs_bohemian_rhapsody/
mynu.item "Is this the real life?" do |menu|
  menu.item "Is this just fantasy?" do |menu|
    menu.item "Caught in a landslide" do |menu|
      menu.item "No escape from reality" do |menu|
        menu.item "Open your eyes" do |menu|
          menu.item "Look up to the skies and see" do |menu|
            menu.item "I'm just a poor boy (poor boy), I need no sympathy" do |menu|
              menu.item "Because I'm easy come, easy go" do |menu|
                menu.item "little high, little low" do |menu|
                  menu.item "Anyway the wind blows, doesn't really matter to me, to me" do |menu|
                    menu.item "Mama, just killed a man" do |menu|
                      menu.item "Put a gun against his head" do |menu|
                        menu.item "Pulled my trigger, now he's dead" do |menu|
                          menu.item "Mama, life had just begun" do |menu|
                            menu.item "But now I've gone and thrown it all away" do |menu|
                              menu.item "Mama, ooo" do |menu|
                                menu.item "Didn't mean to make you cry" do |menu|
                                  menu.item "If I'm not back again this time tomorrow" do |menu|
                                    menu.item "Carry on, carry on, as if nothing really matters" do |menu|
                                      menu.item "It's too late, my time has come" do |menu|
                                        menu.item "Sends shivers down my spine" do |menu|
                                          menu.item "Body's aching all the time" do |menu|
                                            menu.item "Goodbye everybody - I've got to go" do |menu|
                                              menu.item "Gotta leave you all behind and face the truth" do |menu|
                                                menu.item "Mama, ooo - (anyway the wind blows)" do |menu|
                                                  menu.item "I don't want to die" do |menu|
                                                    menu.item "I sometimes wish I'd never been born at all" do |menu|
                                                      menu.item "I see a little silhouetto of a man" do |menu|
                                                        menu.item "Scaramouche, scaramouche, will you do the fandango?" do |menu|
                                                          menu.item "Thunderbolts and lightning - very very frightening me" do |menu|
                                                            menu.item "Galileo, Galileo," do |menu|
                                                              menu.item "Galileo, Galileo," do |menu|
                                                                menu.item "Galileo Figaro - magnifico-o-o-o" do |menu|
                                                                  menu.item "I'm just a poor boy nobody loves me" do |menu|
                                                                    menu.item "He's just a poor boy from a poor family" do |menu|
                                                                      menu.item "Spare him his life from this monstrosity" do |menu|
                                                                        menu.item "Easy come easy go - will you let me go" do |menu|
                                                                          menu.item "It's the LAW! No - we will not let you go - let him go" do |menu|
                                                                            menu.item "It's the LAW! We will not let you go - let him go" do |menu|
                                                                              menu.item "It's the LAW! We will not let you go - let me go" do |menu|
                                                                                menu.item "Will not let you go - let me go (never)" do |menu|
                                                                                  menu.item "Never let you go - let me go" do |menu|
                                                                                    menu.item "Never let me go - ooo" do |menu|
                                                                                      menu.item "No, no, no, no, no, no, no" do |menu|
                                                                                        menu.item "Oh mama mia, mama mia, mama mia let me go" do |menu|
                                                                                          menu.item "Beelzebub has the devil put aside for me" do |menu|
                                                                                            menu.item "for me" do |menu|
                                                                                              menu.item "for me" do |menu|
                                                                                                menu.item "for me" do |menu|
                                                                                                  menu.item "So you think you can stone me and spit in my eye?" do |menu|
                                                                                                    menu.item "So you think you can love me and leave me to die?" do |menu|
                                                                                                      menu.item "Oh baby - can't do this to me baby" do |menu|
                                                                                                        menu.item "Just gotta get out - just gotta get right outta here" do |menu|
                                                                                                          menu.item "Ooh yeah, ooh yeah" do |menu|
                                                                                                            menu.item "Nothing really matters" do |menu|
                                                                                                              menu.item "Anyone can see" do |menu|
                                                                                                                menu.item "Nothing really matters, nothing really matters, to me" do |menu|
                                                                                                                  menu.item "Anyway the wind blows..." do |menu|
                                                                                                                    menu.execute do 
                                                                                                                      puts "Exit stage left"
                                                                                                                      Process.exit
                                                                                                                    end
                                                                                                                  end
                                                                                                                end
                                                                                                              end
                                                                                                            end
                                                                                                          end
                                                                                                        end
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

mynu.run
