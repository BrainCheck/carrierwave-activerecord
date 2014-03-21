module CarrierWave
  module Storage
    module ActiveRecord

      class ActiveRecordFile < ::ActiveRecord::Base
        # This need to be the same table , Maybe migration required ?? 
        self.table_name = CarrierWave::Uploader::Base.active_record_tablename

        alias_method    :delete, :destroy
        alias_attribute :read, :data

        attr_accessible :identifier,
                        :original_filename,
                        :content_type,
                        :size,
                        :data
      end # ActiveRecordFile

    end # ActiveRecord
  end # Storage
end # CarrierWave
