require 'net/http'
require 'uri'
require 'json'

module Client
  class OpenDota
    OPENDOTA_API_BASE = "https://api.opendota.com/api"
    
    def initialize(api_key:)
      @api_key = api_key
    end

    def fetch_match(id:)
      uri = URI.parse(OPENDOTA_API_BASE + "/matches/" + id + "?api_key=" + @api_key)
      response = Net::HTTP.get_response(uri)
      response = JSON.parse(response.body)
      puts response["picks_bans"]
    end
  end
end