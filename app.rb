require 'sinatra'
require 'csv'
require 'aws/s3' 

get '/' do
  # turns CSV into array with nested arrays
  @names = CSV.read('names.csv')
  # delete headers
  @names.shift
  erb :names
end


