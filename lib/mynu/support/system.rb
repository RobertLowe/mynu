load_bridge_support_file File.dirname(__FILE__) + '/bridgesupport/SystemEvents.bridgesupport'

class Mynu
  module Support
    class System
      attr_accessor :system

      CommandDown = SystemEventsEMdsCommandDown
      ControlDown = SystemEventsEMdsControlDown
      OptionDown  = SystemEventsEMdsOptionDown
      ShiftDown   = SystemEventsEMdsShiftDown

      def initialize
        self.system = SBApplication.applicationWithBundleIdentifier("com.apple.SystemEvents")
      end
      
      # wrapping a native selector
      def keystroke(keys, using=0)
        @system.send(:"keystroke:using:", keys, using)
      end

      def method_missing(method, *args)
        args.empty? ? @system.send(method) : @system.send(method, args)
      end
    end
  end
end

