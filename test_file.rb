# set your bucket region to us- standard
# go into bucket then properties then permission- add more permissions - any authenicated aws users- check box for list, upload/delete,
# be sure that u have created iam user under services tab of aws //directions next line
# attach user policy under user permission.  go services then clicked iam then create new user, then permissions, attach policy -- s3 full acess

# gem install aws-s3 --source http://rubygems.org   # this is for windows, mac was just gem install aws-s3
#aws-sdk


# click on your name then security credentials then iam user. 
#then creat the iam user
# then click on policies  which is in left side menu
#then search s3 and check allow full access, then attach policy to user u just created

require 'rubygems'
require 'aws/s3'
require 'csv'
 #load "./local_env.rb" 

def send_data_to_s3_bucket
	AWS::S3::Base.establish_connection!(
  	:access_key_id => ENV['S3_KEY'],
 	 :secret_access_key => ENV['S3_SECRET']  
	)
	file = "summary.csv" 
	bucket = 'tttresults'
	csv = AWS::S3::S3Object.value(file, bucket)
	csv << "some code here to show something being added to the bucket."+ "\n"

	AWS::S3::S3Object.store(File.basename(file), 
        csv, 
        bucket, 
        :access => :public_read)
end

send_data_to_s3_bucket

