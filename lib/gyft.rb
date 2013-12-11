require "gyft/version"

begin
  require "rest-client"
  require "multi_json"
rescue LoadError
end

module Gyft
  @tstamp = ""
  @endpoint = "http://sandbox.gyft.com"

  class << self
    attr_accessor :endpoint, :api_key, :secret_key
  end

  def self.request
    begin
      @tstamp = self.timestamp
      RestClient.get 'http://sandbox.gyft.com/v1/reseller/account', params: { api_key: "nkspvnetef3yyj5ytvsjdkwk", sig: "#{self.signature}" }, headers: {"x-sig-timestamp" => "#{@tstamp}"} 
    rescue => e
      e.response
    end
  end

  def self.health
    @tstamp = self.timestamp
    RestClient.get 'http://sandbox.gyft.com/v1/health/check', params: { api_key: "nkspvnetef3yyj5ytvsjdkwk", sig: "#{self.signature}" }, headers: { "x-sig-timestamp" => "#{@tstamp}"}
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

  def self.signature      
    sha256 = Digest::SHA256.new
    sha256.hexdigest "nkspvnetef3yyj5ytvsjdkwk" + "aPkbyRjvbX" + @tstamp
  end
end
