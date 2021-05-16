module Twitterwatch
    module Commands
      class Exit < Twitterwatch::Command
        self.meta = {
          :description => "Exit Twitterwatch",
          :names       => %w(exit quit q),
          :usage       => "exit"
        }
  
        def run
          output "Goodbye."
          exit
        end
      end
    end
  end
  