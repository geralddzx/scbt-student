class ActiveRecord::Base     
  def save_file(file_type)
  	bucket = AWS::S3.new.buckets[ENV['AWS_BUCKET']]
  	bucket.acl = :private
    s3_object = bucket.objects[file_key(file_type)]
    s3_object.write(self.@content)
  end

  def file_key(file_type)
  	"#{self.class.to_s.underscore}/#{self.id}/#{file_type}"
  end
end