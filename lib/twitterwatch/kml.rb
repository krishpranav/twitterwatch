module Twitterwatch
    class KML
      # KML document header
      DOCUMENT_HEADER =
  <<-HEAD
  <?xml version="1.0" encoding="UTF-8"?>
  <kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
  HEAD
  
      
      DOCUMENT_FOOTER =
  <<-FOOT
  </Document>
  </kml>
  FOOT
  
      class Error < StandardError; end
      class UnknownFolderError < Twitterwatch::KML::Error; end
  

      def initialize(attributes = {})
        @attributes = attributes
        @folders    = {}
        @placemarks = []
      end
  

      def add_placemark(attributes)
        @placemarks << attributes
      end
  

      def add_folder(id, attributes)
        @folders[id] = {
          :placemarks => []
        }.merge(attributes)
      end
  

      def add_placemark_to_folder(folder_id, attributes)
        fail(UnknownFolderError, "There is no folder with id: #{folder_id}") unless @folders.key?(folder_id)
        @folders[folder_id][:placemarks] << attributes
      end
  

      def generate
        output = generate_document_header
        @folders.each_pair { |id, attributes| output += generate_folder(id, attributes) }
        output += @placemarks.map { |p| generate_placemark(p) }.join
        output += generate_document_footer
      end
  
      private
  

      def generate_document_header
        header = DOCUMENT_HEADER
        @attributes.each_pair { |k, v| header += "<#{k}>#{escape(v)}</#{k}>\n" }
        header
      end
  

      def generate_document_footer
        DOCUMENT_FOOTER
      end
  

      def generate_placemark(attributes)
        placemark = attributes.key?(:id) ? "<Placemark id='#{escape(attributes[:id])}'>" : "<Placemark>"
        attributes.delete(:id)
        attributes.each_pair { |k, v| placemark += "<#{k}>#{v}</#{k}>\n" }
        placemark += "</Placemark>\n"
      end
  

      def generate_folder(id, attributes)
        placemarks = attributes.delete(:placemarks)
        folder = "<Folder id='#{escape(id)}'>"
        attributes.each_pair { |k, v| folder += "<#{k}>#{escape(v)}</#{k}>\n" }
        folder += placemarks.map { |p| generate_placemark(p) }.join
        folder += "</Folder>\n"
      end
  
      def escape(string)
        CGI.escapeHTML(string.to_s)
      end
    end
  end
  