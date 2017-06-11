require 'net/http'
require 'rubygems'
require 'rest-client'
require 'date'
require 'uri'
require 'securerandom'
require 'openssl'
require 'base64'

module API

  CHARLES_PROXY = "http://localhost:8888/"
  
  def api(path, params: {}, form: nil, headers: {:accept => "application/json", "Content-Type" => "application/json" }, method: "get")
    headers["Authorization"] = "Bearer #{@token}" unless @token.nil?
    url = add_metadata "#{@api_base}/#{path}"
    if form
      body = URI.encode_www_form form
      headers["Content-Type"] = "application/x-www-form-urlencoded"
      signature = sign method.upcase, url, body
      headers["Authorization"] = "Signature #{signature}"
    elsif method.downcase =~ /(post|put|patch)/
      body = JSON.generate remove_nil_params(params)
      signature = sign method.upcase, url, body
      url = add_params(url, {:signature => signature})
    else
      body = ""
      url = add_params(url, params)
      signature = sign method.upcase, url
      url = add_params(url, {:signature => signature})
    end
    begin
      RestClient.proxy = CHARLES_PROXY
      rest_call method, url, body, headers
    rescue Errno::ECONNREFUSED
      RestClient.proxy = nil
      rest_call method, url, body, headers
    end
  end

  private
  
  # Remove nil params, and replace :null with nil
  def remove_nil_params params
    result = {}
    params.select {|k,v| !v.nil? }.map {|k,v| 
      if v === :null
        result[k] = nil
      elsif v.is_a?(Hash)
        result[k] = remove_nil_params v
      elsif v.is_a?(Array)
        result[k] = v.map {|x| (x.is_a?(Hash) || x.is_a?(Array) ? remove_nil_params(x) : x) }
      else
        result[k] = v
      end
    }
    result
  end
  
  def rest_call method, url, body, headers
    begin
      if method.downcase =~ /(post|put|patch)/
        RestClient.send method.downcase, url, body, headers
      else
        RestClient.send method.downcase, url, headers
      end
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  def add_params(url, params)
    uri = URI(url)
    query = URI.decode_www_form(uri.query || "")
    params.each { |k,v| query << [k,v == :null ? nil : v] unless v.nil? || ( v.is_a?(Array) && v.empty? ) }
    uri.query = URI.encode_www_form(query)
    uri.to_s
  end

  def add_metadata url
    add_params url, {:apikey => @api_key, :nonce => SecureRandom.uuid, :timestamp => Time.now.to_i}
  end
  
  def sign method, url, body = ""
    str = "#{method}\u0000#{url}\u0000#{body}"
    signature = OpenSSL::HMAC.digest("sha256", @api_secret, str).unpack("H*")[0].downcase
  end

end
