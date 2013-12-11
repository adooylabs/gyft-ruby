require "gyft/version"

begin
  require "rest-client"
  require "multi_json"
rescue LoadError
end

module Gyft
  @api = "8ja46uvwvbms7zcez4wthagx"
  @secret = "fcjJA7TJ9X"
  @tstamp = ""
  @endpoint = "http://sandbox.gyft.com/v1/"

  class << self
    attr_accessor :endpoint, :api_key, :secret_key
  end

  def self.request
    begin
      @tstamp = self.timestamp
      RestClient.get "#{@endpoint}reseller/account", params: { api_key: "#{@api}", sig: "#{self.signature(@tstamp)}" }, headers: {"x-sig-timestamp" => "#{@tstamp}"} 
    rescue => e
      e.response
    end
  end

  def self.health
    @tstamp = self.timestamp
    RestClient.get "#{@endpoint}health/check", params: { api_key: "#{@api}", sig: "#{self.signature(@tstamp)}" }, headers: { "x-sig-timestamp" => "#{@tstamp}"}
  end

  def self.check
    @tstamp = self.timestamp
    RestClient::Resource.new "#{@endpoint}health/check", params: { api_key: "#{@api}", sig: "#{self.signature(@tstamp)}" }, headers: { "x-sig-timestamp" => "#{@tstamp}"}
  end

  def account_info

  end

  def list_transaction
    
  end

  def purchase_card
    
  end

  def endpoint_url

  end

  def self.timestamp
    span = Time.now.utc - Time.utc(1970,1,1)
    span = span.to_i.to_s
  end

  def self.signature(timestamp)    
    sha256 = Digest::SHA256.new
    sha256.hexdigest "#{@api}" + "#{@secret}" + "#{timestamp}"
  end
end
