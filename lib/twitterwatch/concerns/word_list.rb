module Twitterwatch
    module Concerns
        module Wordlist
            def self.included(base)
                base.extend(ClassMethods)
            end

            module ClassMethods
            end

            def make_word_list(options = {})
                Twitterwatch::Wordlist.new(options)
            end
        end
    end
end

