require 'net/https'
require 'net/http'
require 'uri'
require 'json'
require 'pry'

token = "Your token"
url = URI.parse("https://api.zoom.us/v2/users")
request = Net::HTTP::Get.new(url)

request["Authorization"] = "Bearer  #{token}"
req_options = {
  use_ssl: url.scheme == "https",
}

response = Net::HTTP.start(url.hostname, url.port, req_options) do |http|
  http.request(request)
end

res_body = JSON.parse(response.body)
puts res_body
