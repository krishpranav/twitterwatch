module Twitterwatch
    module Concerns
      module Outputting
        def self.included(base)
          base.extend(ClassMethods)
        end
  
        module ClassMethods
        end
  
        # Output data to the console
        #
        # Simply outputs the given data to the console.
        #
        # For more convenient and consistant outputting, see the {info}, {task},
        # {error}, {warn} and {fatal} methods.
        def output(data)
          Twitterwatch::Console.instance.output(data)
        end
  
        # Output formatted data to the console
        #
        # Outputs data with +printf+ formatting.
        #
        # @example
        #    output_formatted("%-15s %s\n", title, description)
        #
        # @param *args Args to be passed
        def output_formatted(*args)
          Twitterwatch::Console.instance.output_formatted(*args)
        end
  
        # Output a newline to the console
        #
        # Used for consistant spacing in console output
        def newline
          Twitterwatch::Console.instance.newline
        end
  
        # Output a line to the console
        #
        # Used for consistant spacing and separation between console output
        def line_separator
          Twitterwatch::Console.instance.line_separator
        end
  
        # Output an informational message to the console
        #
        # @param message [String] Message to display
        #
        # Formats the message as an informational message
        def info(message)
          Twitterwatch::Console.instance.info(message)
        end
  
        # Output an informational message to the console that reports when a
        # longer-running task is done.
        #
        # @param message [String] Message to display
        # @param fatal [Boolean] OPTIONAL if an exception is raised, treat it as a fatal error
        # @param block The code block to yield
        #
        # @example performing a long-running task
        #    task("Performing a long, time consuming task...") do
        #      long_running_task
        #    end
        def task(message, fatal = false, &block)
          Twitterwatch::Console.instance.task(message, fatal, &block)
        end
  
        # Output an error message to the console
        #
        # @param message [String] Message to display
        #
        # Formats the message as an error message
        def error(message)
          Twitterwatch::Console.instance.error(message)
        end
  
        # Output a warning message to the console
        #
        # @param message [String] Message to display
        #
        # Formats the message as a warning message
        def warn(message)
          Twitterwatch::Console.instance.warn(message)
        end
  
        # Output a fatal message to the console
        #
        # @param message [String] Message to display
        #
        # Formats the message as a fatal message
        def fatal(message)
          Twitterwatch::Console.instance.fatal(message)
        end
  
        # Ask the user for confirmation
        #
        # @param question [String] Yes/No question to ask the user
        #
        # Waits for the user to answer Yes or No to a question. Useful for making
        # the user confirm destructive actions before executing them.
        #
        # @example make user confirm division by zero
        #    if confirm("Do you really want divide by zero?")
        #      0 / 0
        #    end
        def confirm(question)
          Twitterwatch::Console.instance.confirm(question)
        end
      end
    end
  end
  