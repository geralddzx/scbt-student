class ActiveRecord::Base     
  # def save_file(file_type)
  # 	bucket = AWS::S3.new.buckets[ENV['AWS_BUCKET']]
  # 	bucket.acl = :private
  #   s3_object = bucket.objects[file_key(file_type)]
  #   s3_object.write(self.@content)
  # end

  # def file_key(file_type)
  # 	"#{self.class.to_s.underscore}/#{self.id}/#{file_type}"
  # end
end

def to_unit(num)
  units = ["B", "KB", "MB", "GB"]
  hash = Hash.new
  units.each_index do |index|
    hash[units[index]] = num * 1.0 / (1024 ** index)
  end
  hash.select! do |k,v|
    v.round > 0
  end
  best_key = hash.key(hash.values.min)
  hash[best_key].round(1).to_s + " " + best_key
end

def to_digit(x, n)
  ("0" * n + x.to_s)[(-n)..-1]
end

class Time
	def to_clock
		"#{to_digit(hour, 2)}:#{to_digit(min, 2)}:#{to_digit(sec,2)}"
	end

  def to_date_clock
    to_s(:full_english)
  end
end