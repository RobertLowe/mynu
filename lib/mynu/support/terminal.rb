load_bridge_support_file File.dirname(__FILE__) + '/bridgesupport/Terminal.bridgesupport'

class Mynu
  module Support
    class Terminal
      attr_accessor :system
      attr_accessor :terminal

      def initialize
        self.system   = Mynu::Support::System.new
        self.terminal = SBApplication.applicationWithBundleIdentifier("com.apple.Terminal")
      end

      def method_missing(method, *args)
        args.empty? ? @terminal.send(method) : @terminal.send(method, args)
      end

      def wait_for_terminal_tab(terminal_tab)
        while(terminal_tab.busy)
          sleep 0.25
        end
      end

      # For terminal.app I use an SIMBL plugin called Visor, this intergates tab support for your primary (first) window
      # If someone wants to write support for multiple windows, it would help the project a lot!
      def create_tab(command, options = {})
        options = {
          :exit => false,
          :focus => false
        }.merge(options)

        current_process  = nil
        terminal_process = nil

        terminals = self.windows.first.tabs.map do |terminal_tab|
          terminal_tab
        end

        system.processes.each do |process|
          current_process = process if process.frontmost
        end
        system.processes.each do |process|
          terminal_process = process if process.shortName == "Terminal"
        end

        terminal_process.setFrontmost true
        system.keystroke "t", Mynu::Support::System::CommandDown
        system.keystroke "#{command}\r" if command.length > 0

        current_terminals = self.windows.first.tabs.map do |terminal_tab|
          terminal_tab
        end

        new_terminal_tab = nil
        current_terminals.each do |terminal_tab|
          new_terminal_tab = terminal_tab unless terminals.include?(terminal_tab)
        end

        # exit the new tab
        if options[:exit]
          # broken: 
          # new_terminal_tab.send(:"closeSaving:savingIn:", TerminalSaveOptionsNo, nil)
          wait_for_terminal_tab(new_terminal_tab)
          system.keystroke("exit\r")
          wait_for_terminal_tab(new_terminal_tab)
          system.keystroke "w", Mynu::Support::System::CommandDown
        end

        current_process.setFrontmost true unless options[:focus]

        new_terminal_tab
      end
    end
  end
end

