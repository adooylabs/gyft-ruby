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

  def self.account
    begin
      @tstamp = self.timestamp
      client = RestClient::Resource.new "#{@endpoint}reseller/account?api_key=#{@api}&sig=#{self.signature(@tstamp)}", headers: {"x-sig-timestamp" => "#{@tstamp}"},  accept: :json
      res = client.get
      JSON.parse(res)
    rescue => e
      e.response
    end
  end

  def self.request
    begin
      @tstamp = self.timestamp
      client = RestClient::Resource.new "#{@endpoint}reseller/account?api_key=#{@api}&sig=#{self.signature(@tstamp)}", headers: {"x-sig-timestamp" => "#{@tstamp}"},  accept: :json
      res = client.get
      JSON.parse(res)
    rescue => e
      e.response
    end
  end

  def self.health
    begin
      @tstamp = self.timestamp
      client = RestClient::Resource.new "#{@endpoint}health/check?api_key=#{@api}&sig=#{self.signature(@tstamp)}", headers: {"x-sig-timestamp" => "#{@tstamp}"},  accept: :json
      res = client.get
      res.code #since does not return any data reutnr respond code itself
    rescue => e
      e.response
    end
  end

  def list_transaction
    
  end

  def purchase_card
    
  end

  def endpoint_url

  end

  def self.timestamp
    span = Time.now.to_i
  end

  def self.signature( timestamp )
    msg = "#{@api}" + "#{@secret}" + "#{timestamp}"
    Digest::SHA256.hexdigest msg
  end
end
