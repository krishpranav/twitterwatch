module Twitterwatch
    class Module
      class Error < StandardError; end
      class InvalidMetadataError < Error; end
      class MetadataNotSetError < Error; end
      class UnknownOptionError < Error; end
  
      include Twitterwatch::Concerns::Core
      include Twitterwatch::Concerns::Util
      include Twitterwatch::Concerns::Outputting
      include Twitterwatch::Concerns::Presentation
      include Twitterwatch::Concerns::Persistence
      include Twitterwatch::Concerns::Concurrency
      include Twitterwatch::Concerns::WordList
  

      MODULE_PATH = File.join(File.dirname(__FILE__), "modules").freeze
  

      def self._file_path
        @_file_path
      end
  

      def self._file_path=(path)
        @_file_path = path
      end
  

      def self.inherited(k)
        k._file_path = caller.first[/^[^:]+/]
      end
  

      def self.meta
        @meta || fail(MetadataNotSetError, "Metadata has not been set")
      end
  

      def self.meta=(meta)
        validate_metadata(meta)
        @meta = meta
      end
  
      # Get a module by it's path
      # @private
      #
      # @param path [String] Module's short path
      #
      # @return [Twitterwatch::Module] descendant
      def self.module_by_path(path)
        modules[path]
      end
  
      # Get module short paths
      # @private
      def self.module_paths
        modules.keys
      end
  
      # Get the module's short path
      # @private
      def self.path
        @_file_path.gsub("#{MODULE_PATH}/", "").gsub(".rb", "")
      end
  

      def self.info; end

      def self.descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end
  

      def self.modules
        if !@modules
          @modules = {}
          descendants.each do |descendant|
            @modules[descendant.path] = descendant
          end
        end
        @modules
      end
  

      def execute
        validate_options && run
      rescue => e
        error("#{e.class}".bold + ": #{e.message}")
        puts e.backtrace.join("\n")
      end
  

      def run
        fail NotImplementedError, "Modules must implement #run method"
      end
  
      protected
  

      def validate_options
        options.each_pair do |key, value|
          if value[:required] && value[:value].nil?
            error("Setting for required option has not been set: #{key.bold}")
            return false
          end
        end
      end

      def self.validate_metadata(meta)
        fail InvalidMetadataError, "Metadata is not a hash" unless meta.is_a?(Hash)
        fail InvalidMetadataError, "Metadata is empty" if meta.empty?
        fail InvalidMetadataError, "Metadata is missing key: name" unless meta.key?(:name)
        fail InvalidMetadataError, "Metadata is missing key: description" unless meta.key?(:description)
        fail InvalidMetadataError, "Metadata is missing key: author" unless meta.key?(:author)
        fail InvalidMetadataError, "Metadata is missing key: options" unless meta.key?(:options)
        fail InvalidMetadataError, "Metadata name is not a string" unless meta[:name].is_a?(String)
        fail InvalidMetadataError, "Metadata description is not a string" unless meta[:description].is_a?(String)
        fail InvalidMetadataError, "Metadata author is not a string" unless meta[:author].is_a?(String)
        validate_metadata_options(meta[:options])
      end
  

      def self.validate_metadata_options(options)
        fail InvalidMetadataError, "Metadata options is not a hash" unless options.is_a?(Hash)
        options.each_pair do |key, value|
          fail("Option key #{key} must be all uppercase") unless (key == key.upcase)
          fail("Option value for #{key} is not a hash") unless value.is_a?(Hash)
          fail("Option value for #{key} is missing key: value") unless value.key?(:value)
          fail("Option value for #{key} is missing key: description") unless value.key?(:description)
          fail("Option value for #{key} is missing key: required") unless value.key?(:required)
        end
      end
  

      def options
        self.class.meta[:options]
      end

      def option_setting(option)
        option = option.to_s.upcase
        fail UnknownOptionError, "Unknown module option: #{option}" unless options.keys.include?(option)
        options[option][:value]
      end
    end
  end
  