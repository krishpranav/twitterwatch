module Twitterwatch
    module Models 
        class Influencer < Sequel::Model
            many_to_one :workspace
            many_to_many :users
        end
    end
end
