module BotController3Helper
  require 'net/http'
  require 'json'

  def get_giph
    url = "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=kitty"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    giph = result['data']['image_url']
    return giph
  end
end