require 'uri'

module Phase5
  class Params
    # use your initialize to merge params from
    # 1. query string
    # 2. post body
    # 3. route params
    #
    # You haven't done routing yet; but assume route params will be
    # passed in as a hash to `Params.new` as below:
    def initialize(req, route_params = {})
      req.query_string.nil? ? @params = {} : @params = parse_www_encoded_form(req.query_string)
      @params.merge!(route_params)
      @params.merge!(parse_www_encoded_form(req.body)) unless req.body.nil?
    end

    def [](key)
      @params[key]
    end

    def to_s
      @params.to_json.to_s
    end

    class AttributeNotFoundError < ArgumentError; end;

    private
    # this should return deeply nested hash
    # argument format
    # user[address][street]=main&user[address][zip]=89436
    # should return
    # { "user" => { "address" => { "street" => "main", "zip" => "89436" } } }
    def parse_www_encoded_form(www_encoded_form)
      params_array = URI::decode_www_form(www_encoded_form).map { |key, value| [parse_key(key), value] }
      params_hash = {}
  
      params_array.each do |param|
        current = params_hash
        keys = param[0]
        value = param[1]
    
        keys.each_with_index do |key, i|
          if i == (keys.length - 1)
            current[key] = value
          else
            current[key] ||= {}
            current = current[key]
          end
        end
      end

      params_hash
    end

    # this should return an array
    # user[address][street] should return ['user', 'address', 'street']
    def parse_key(key)
      key.split(/\]\[|\[|\]/)
    end
  end
end
