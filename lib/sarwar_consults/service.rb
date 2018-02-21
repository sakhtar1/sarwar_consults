require 'pry'

class SarwarConsults::Service
  attr_accessor :title, :url, :content, :signup


    def initialize (title = nil, url = nil, content = nil)
      @title = title
      @url = url
      @content = content
    end

    def self.all
      @@all ||= scrape_services
    end

    def self.find(id)
      self.all[id-1]
    end

    def self.find_by_title(title)
      self.all.detect do |m|
        m.title.downcase.strip == title.downcase.strip ||
        m.title.split("(").first.strip.downcase == title.downcase.strip
      end
    end

    def self.signup
      @signup ||= get_service.search("#menu-item-1663 a").map{|sign| sign['href']}.join("")
    end

    def scrape_content
      doc = Nokogiri::HTML(open("#{self.url}"))
      @content ||= doc.search("p").text.strip
    end

    private

      def self.scrape_services
        title = get_service.search("p a")
        title.collect{|e| new(e.text.strip, "#{e.attr("href").split("?").first.strip}")}
      end


      def self.get_service
        Nokogiri::HTML(open('http://sarwarconsults.com/services/'))
      end

    # binding.pry

end
