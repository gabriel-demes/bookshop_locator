class YelpService 
    attr_accessor :client

    DEFAULT_TERM = "book store"
    SEARCH_LIMIT = 15
    API_KEY = ENV["YELP_API_KEY"]

    def initialize
        @client = Yelp::Fusion::Client.new(API_KEY)
        
    end

    def find_shops(zip_code)
        @client.search(zip_code, {term: DEFAULT_TERM, limit: SEARCH_LIMIT})
        
    end


end