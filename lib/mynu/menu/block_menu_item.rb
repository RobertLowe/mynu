class Mynu
  module Menu
    class BlockMenuItem < MenuItem
      include Dsl::Block
      alias_method :link, :open

      def initialize(title, block)
        super

        self.title = title

        self.action = 'call:'
        self.target = block
      end

      def execute(&block)
        self.action = 'call:'
        self.target = item_block(block){}
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

