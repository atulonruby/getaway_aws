require 'aws-sdk'

module GetawayAws
  class Uploader
     attr_accessor :file, :file_name_in_bucket, :bucket_name

     def initialize(options={})

       @file_name_in_bucket = options[:file_name] 
       @file = File.open(options[:path])
       @bucket_name = options[:bucket_name] || "PracticeSession"
       @key = options[:key]
       @secret_key = options[:secret]

       
       AWS.config(
         :access_key_id => @key, 
         :secret_access_key => @secret_key
       )
       s3 = AWS::S3.new
       bucket_name = @bucket_name
       file_name = @file
    
       s3.buckets[bucket_name].objects[@file_name_in_bucket].write(:file => @file)
     end

  end
end
