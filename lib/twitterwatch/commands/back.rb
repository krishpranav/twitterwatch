module Twitterwatch
    module Commands
        class Back < Twitterwatch::Command
            self.meta = {
                :description => "Unloads current module",
                :names       => %w(back unload),
                :usage       => "back"
            }

            def run
                console.current_module = nil
            end
        end
    end
end
