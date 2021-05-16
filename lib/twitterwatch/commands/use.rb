module Twitterwatch
    module Commands
      class Use < Twitterwatch::Command
        self.meta = {
          :description => "Load specified module",
          :names       => %w(use load),
          :usage       => "use MODULE_PATH"
        }
  
        def run
          if !arguments?
            error("You must provide a module path")
            return false
          end
  
          if !_module = Twitterwatch::Module.module_by_path(arguments.first)
            error("Unknown module: #{arguments.first.bold}")
            return false
          end
  
          console.current_module = _module
        end
      end
    end
  end
  