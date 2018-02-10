class SarwarConsults::Service
  attr_accessor :url, :title

    def initialize
      @url = []
      @title = []
    end

    def self.get_service
      Nokogiri::HTML(open('http://sarwarconsults.com/services/'))
    end

    def self.scrape_signup
      get_service.search("#menu-item-1663 a").map{|sign| sign['href']}.join("")
    end

    def self.scrape_services
      @title= get_service.search("p a").collect{|item| item.text}
    end

    def self.scrape_url
      @url = get_service.search("p a").collect{|link| link['href']}
    end

    def self.scrape_content(url)
      doc = Nokogiri::HTML(open(url))
      doc.search("p").text.strip
    end

end
