require 'rubygems'
require 'httparty'

tweets = HTTParty.get('http://search.twitter.com/search.json', 
  :query => {:q => "rubymanor"}, 
  :format => :json, 
  :headers => {'User-Agent' => 'Ruby Twitter Gem'}
)["results"].collect{|result| result["text"] }.join("\n")

File.open('tweets.txt', 'w') do |f|
  f << tweets
end