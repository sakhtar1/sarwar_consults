class SarwarConsults::Service
  attr_accessor :url, :service

    def initialize
      @url = []
      @service = []
    end
    
    def get_service
      Nokogiri::HTML(open('http://sarwarconsults.com/services/'))
    end

    def scrape_signup
      get_service.search("#menu-item-1663 a").map{|sign| sign['href']}.join("")
    end

    def scrape_services
      @service = get_service.search("p a").collect{|item| item.text}
    end

    def scrape_url
      @url = get_service.search("p a").collect{|link| link['href']}
    end

    def scrape_content(url)
      doc = Nokogiri::HTML(open(url))
      doc.search("p").text.strip
    end

end
