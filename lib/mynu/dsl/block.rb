class Mynu
  module Dsl
    module Block
      def item(title, &block)
        if block_given?
          item = Menu::BlockMenuItem.new(title, block)
          @items << item
          item
        else
          raise
        end
      end
    end
  end
end

