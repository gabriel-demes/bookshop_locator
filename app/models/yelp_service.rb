class YelpService 
    attr_accessor :client, :my_businesses

    DEFAULT_TERM = "book store"
    SEARCH_LIMIT = 15
    API_KEY = ENV["YELP_API_KEY"]

    def initialize
        @client = Yelp::Fusion::Client.new(API_KEY)
        
    end

    def find_shops(zip_code)
        @my_businesses = @client.search(zip_code, {term: DEFAULT_TERM, limit: SEARCH_LIMIT})
        
    end

    def self.display(zip_code)
        display = self.new
        display.find_shops(zip_code)
        display.business_info
    end

    def display_nicely
        businesses.each do |business|
            puts business.name
            puts business.rating
        end
    end

    def business_info
        array = @my_businesses.businesses.map do |business|
            {
                
                
                name: business.name, 
                address: business.location.display_address.join(" "),
                zipcode: business.location.zip_code.to_i,
                phone_number: business.display_phone,
                image: business.image_url,
                rating: business.rating,
                img_rating: "r#{business.rating.to_s[0]}_#{business.rating.to_s[2]}.png"
                
            }
        end
        array
    end


end