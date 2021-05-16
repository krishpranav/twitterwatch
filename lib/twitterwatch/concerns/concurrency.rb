module Twitterwatch

    module Concerns
        module Concurrency

            DEFAULT_THREAD_POOL_SIZE = 10.freeze

            def self.included(base)
                base.extend(ClassMethods)
            end

            module ClassMethods
            end

            def thread_pool(size = nil)
                Thread.pool(size || DEFAULT_THREAD_POOL_SIZE)
            end
        end
    end
end
