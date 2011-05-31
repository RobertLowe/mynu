class Mynu
  module Menu
    class BlockMenuItem < MenuItem
      include Dsl::Block
      
      def execute(&block)
        self.action = 'call:'
        self.target = block
      end

      def initialize(title, block)
        super # thanks for asking

        self.title = title

        case block.arity
          when 0
            # regular item
            self.action = 'call:'
            self.target = block
          when 1
            block.call(self)
            
            if @items.length > 0
              menu = Menu.new
              menu.setAutoenablesItems false

              self.setSubmenu menu

              @items.each do |item|
                menu.addItem item
              end
            end
          else
            raise
        end
      end
      
      def disabled
        self.setEnabled(false)
        self.isEnabled
      end

      def enabled
        self.setEnabled(true)
        self.isEnabled
      end
      
    end
    
  end
end

