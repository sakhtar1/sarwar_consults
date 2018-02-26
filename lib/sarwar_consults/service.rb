require 'pry'
class SarwarConsults::Service
  attr_accessor :title, :url, :content, :signup


    def initialize (title = nil, url = nil)
      @title = title
      @url = url
    end

    def self.all
      @@all ||= scrape_services
    end

    def self.find(id)
      self.all[id-1]
    end

    def self.signup
      @signup ||= get_service.search("#menu-item-1663 a").attr('href').text
    end

    def scrape_content
      doc = Nokogiri::HTML(open("#{self.url}"))
      @content ||= doc.search("p").text.strip
    end

    private

    def self.scrape_services
       service_titles = get_service.search("p a")
       service_titles.collect{|e| new(e.text.strip, "#{e.attr("href").strip}")}
    end


      def self.get_service
        Nokogiri::HTML(open('http://sarwarconsults.com/services/'))
      end

#binding.pry
end
