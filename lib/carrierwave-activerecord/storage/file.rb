module CarrierWave
  module Storage
    module ActiveRecord 

      class File

        def self.create!(new_file, identifier)
          attributes = { :medium_hash       => identifier,
                         :binary            => new_file.read }

          record = ActiveRecordFile.where(medium_hash: identifier).first
          record = ActiveRecordFile.new if record.blank?
          record.update_attributes(attributes)
  
          self.new record
        end

        def self.fetch! identifier
          self.new ActiveRecordFile.where(medium_hash: identifier).first
        end

        def self.delete_all
          ActiveRecordFile.delete_all
        end


        attr_reader   :file
        attr_accessor :url

        def initialize(file = nil)
          @file = file
        end

        def blank?
          file.nil?
        end

        def read
          file.data if file
        end

        def size
          file.size if file
        end

        def content_type
          file.content_type if file
        end

        def content_type= content_type
          if file
            file.content_type =  content_type
            file.save
          end
        end

        def identifier
          file.identifier if file
        end

        def original_filename
          file.original_filename if file
        end
        alias_method :filename, :original_filename

        def delete
          if file
            file.destroy
          else
            false
          end
        end
        alias_method :destroy!, :delete

      end # File

    end # ActiveRecord
  end # Storage
end # CarrierWave
