class Mynu
  module Menu
    class MenuItem < NSMenuItem
      attr_accessor :items
      # def initialize; @items = []; end # replacement
      define_method(:initialize) do |*params|
        @items = []
      end
    end
  end
end

