class Mynu
  module Dsl
    module Block
      def separator
        @items << NSMenuItem.separatorItem
      end

      def app(title, app, &block)
        block = Proc.new {} unless block_given?
        add_item(
          title, 
          item_block(block) { `open -a #{app}` }
        )
      end

      def open(title, path, &block)
        block = Proc.new {} unless block_given?
        add_item(
          title, 
          item_block(block) { `open #{path}` }
        )
      end

      def terminal(title, command, options={}, &block)
        block = Proc.new {} unless block_given?
        add_item(
          title, 
          item_block(block) {
            terminal = Mynu::Support::Terminal.new
            terminal.create_tab(command, options)
          }
        )
      end

      def item(title, &block)
        block = Proc.new {} unless block_given?
        add_item(
          title, 
          item_block(block) { }
        )
      end

      def menu(title, &block)
        raise "Block must be provided for a menu" unless block_given?
        add_item(
          title, 
          item_block(Proc.new {}) {}
        ) {
          case block.arity
            when 0
              self.instance_eval(&block)
            when 1
              block.call(self)
            else
              raise
          end

          if self.items.length > 0
            menu = Menu.new
            menu.setAutoenablesItems false

            self.setSubmenu menu

            self.items.each do |item|
              menu.addItem item
            end
          end
        }
      end

      def add_item(title, runtime_block, &block)
        item = Menu::BlockMenuItem.new(title, runtime_block)
        item.instance_eval(&block) if block_given?
        @items << item
        item
      end

      def item_block(original_block, &block)
        Receivable.new { |sender|
          block.call(sender) if block
          case original_block.arity
            when 0
              sender.instance_eval(&original_block)
            when 1
              original_block.call(sender)
            else
              raise
          end
        }
      end

    end
  end
end


