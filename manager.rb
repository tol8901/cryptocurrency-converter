require "uri"
require "net/http"
require "json"
require_relative "./coin"

class Manager
  # Will manage all operations.
  # Will get recent values of the cryptocurrencies from the API,
  # and create all coin objects, and make all the calculations

  @@repo = {}
  def initialize
    initialize_repo
  end

  # method to create coin objects
  def initialize_repo
    response = web_scrap
    json = JSON.parse(response)
    for symbol,values in json
      coin = Coin.new(symbol, values['USD'], values['EUR'])
      @@repo[symbol] = coin
    end
  end

  # method to parse coin objects
  def web_scrap
    url = "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,XRP,DASH,LTC&tsyms=USD,EUR"
    uri = URI(url)
    Net::HTTP.get(uri)
  end

  # method to return a coin list
  def coin_list
    @@repo.keys
  end

end