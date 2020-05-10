require 'net/https'
require 'net/http'
require 'uri'
require 'json'
require 'pry'

zoom_user_id = "Your zoom_user_id"
token = "Your token"
url = URI.parse("https://api.zoom.us/v2/users/#{zoom_user_id}/meetings")
http = Net::HTTP.new(url.host, url.port)

http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

req = Net::HTTP::Post.new(url.path)
req["Authorization"] = "Bearer #{token}"
req["Content-Type"] = "application/json"

req.body = {
  "topic": "Weekly Meeting",
  "type": "2",
  "start_time": "2020-04-27T18:30:00",
  "timezone": "Asia/Tokyo",
  "settings": {
    "use_pmi": "false"
  }
}.to_json

res = http.request(req)

res_body = JSON.parse(res.body)
puts "Your meeting_room is #{res_body["join_url"]}"
