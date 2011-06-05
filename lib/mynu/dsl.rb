class Mynu
  module Dsl
    autoload :Block, 'mynu/dsl/block'
  end

  class Receivable < Proc
    def call(sender)
      super(sender)
    end
  end
end